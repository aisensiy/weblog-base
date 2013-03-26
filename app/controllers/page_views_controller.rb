class PageViewsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @page_view = current_user.page_views.build(params[:page_view])
    last_page_view = current_user.page_views.order("start_time DESC").first
    if (not last_page_view.nil?) &&
       last_page_view.url == @page_view.url &&
       (@page_view.start_time - last_page_view.start_time).abs < 61000
      logger.info "merge records, title: #{last_page_view.title}"
      last_page_view.start_time = [@page_view.start_time, last_page_view.start_time].min
      last_page_view.end_time = [@page_view.end_time, last_page_view.end_time].max
      last_page_view.duration += @page_view.duration
      last_page_view.save
      respond_to do |format|
        format.json { render json: last_page_view, status: :updated}
      end
    else
      @page_view.save
      respond_to do |format|
        format.json { render json: @page_view, status: :created}
      end
    end

  end

  def index
    @page_views = current_user.page_views.paginate(page: params[:page], per_page: 200).order('start_time DESC')

    respond_to do |format|
      format.html
    end
  end
end

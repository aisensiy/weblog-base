class SearchController < ApplicationController
  before_filter :authenticate_user!
  def index
    term = params[:term]
    @page_views = current_user.page_views.where('url like ? OR title like ?', "%#{term}%", "%#{term}%").paginate(page: params[:page], per_page: 200)
    render 'page_views/index'
  end
end

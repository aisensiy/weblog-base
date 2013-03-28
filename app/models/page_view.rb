class PageView < ActiveRecord::Base
  attr_accessible :duration, :end_time, :start_time, :status, :title, :url, :user_id
  default_scope order('start_time DESC')
  belongs_to :user

  def start_time=(timestamp)
    timestamp = Time.at(timestamp.to_i / 1000.0)
    super
  end

  def end_time(timestamp)
    timestamp = Time.at(timestamp.to_i / 1000.0)
    super
  end
end

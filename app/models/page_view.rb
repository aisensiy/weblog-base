class PageView < ActiveRecord::Base
  attr_accessible :duration, :end_time, :start_time, :status, :title, :url, :user_id

  belongs_to :user
end

require 'test_helper'

class PageViewsControllerTest < ActionController::TestCase
  setup do
    @user = FactoryGirl.create :user
    sign_in @user
  end

  test "should create a new page view" do
    assert_difference "PageView.count" do
      attrs = {}
      attrs[:start_time] = '1364282802309'
      attrs[:duration] = 3000
      attrs[:end_time] = '1364282807309'
      attrs[:url] = 'http://example.com/'
      attrs[:title] = 'title'
      post :create, page_view: attrs
    end
  end
end

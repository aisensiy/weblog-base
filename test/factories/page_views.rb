# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :page_view do
    title "MyString"
    url "http://example.com"
    start_time '1364282802309'
    end_time   '1364282807309'
    duration 3000
    user
  end
end

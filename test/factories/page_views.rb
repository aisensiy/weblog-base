# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :page_view do
    title "MyString"
    url "MyString"
    start_time 1.5
    duration 1
    end_time 1.5
    status "MyString"
    user_id 1
  end
end

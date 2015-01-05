FactoryGirl.define do  factory :comment do
    commenter "MyText"
article nil
user nil
  end

  factory :user do |f|
    f.sequence(:email) { |n| "user#{n}@test.com"}
    f.password "password"
    f.first_name "Test"
    f.sequence(:last_name) { |n| "User#{n}"}
  end
end
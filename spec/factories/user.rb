FactoryGirl.define do
  factory :user do
    sequence(:name, 1) { |n| "Test User#{n}" }             
    sequence(:email, 1) { |n| "email#{n}@sweety.com" }        
    password              "password"
    password_confirmation "password"
  end
end
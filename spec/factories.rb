FactoryGirl.define do 

  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    password               "foobar"
    password_confirmation  "foobar"
    activated    true 
    activated_at Time.zone.now
  end

  factory :item do
    name "Lorem ipsum"
    user
  end
end
FactoryGirl.define do
  factory :user do
    name                   "example user"
    email                  "user@exmaple.com"
    password               "foobar"
    password_confirmation  "foobar"
  end
end
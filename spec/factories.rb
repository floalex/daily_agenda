FactoryGirl.define do  factory :item do
    name "MyString"
user nil
  end

  factory :user do
    name                   "example user"
    email                  "user@exmaple.com"
    password               "foobar"
    password_confirmation  "foobar"
  end
end
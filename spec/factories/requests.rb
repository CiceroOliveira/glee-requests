# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :request do
      track "MyString"
      artist "MyString"
      points 1
    end
end
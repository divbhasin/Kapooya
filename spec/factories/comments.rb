# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    comment "MyString"
    commented_at "2014-08-12 15:03:50"
  end
end

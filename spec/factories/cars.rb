# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :car do
    make "MyString"
    model "MyString"
    year { (1904..2014).to_a.sample }
    price "9.99"
  end
end

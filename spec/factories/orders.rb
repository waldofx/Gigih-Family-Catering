FactoryBot.define do
  factory :order do
    customer_id { 1 }
    total { 1 }
    order_date { "2022-04-18" }
    status { "MyString" }
  end
end

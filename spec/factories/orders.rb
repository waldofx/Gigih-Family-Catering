FactoryBot.define do
  factory :order do
    customer_id { 1 }
    total { "95000" }
    order_date { "2022-04-18" }
    status { "NEW" }
  end

  factory :invalid_order, parent: :order do
    customer_id { nil }
    total { nil }
    order_date { nil }
    status { nil }
  end
end

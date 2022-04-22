FactoryBot.define do
  factory :orderdetail do
    order_id { 1 }
    menuitem_id { 1 }
    quantity { 1 }
  end

  factory :invalid_orderdetail, parent: :orderdetail do
    order_id { nil }
    menuitem_id { nil }
    quantity { nil }
  end
end

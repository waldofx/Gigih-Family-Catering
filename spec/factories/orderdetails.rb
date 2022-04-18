FactoryBot.define do
  factory :orderdetail do
    order_id { 1 }
    menuitem_id { 1 }
    quantity { 1 }
    item_price { 1.5 }
  end
end

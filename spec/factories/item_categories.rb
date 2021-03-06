FactoryBot.define do
  factory :item_category do
    menuitem_id { 1 }
    category_id { 1 }
  end

  factory :invalid_item_category, parent: :item_category do
    menuitem_id { nil }
    category_id { nil }
  end
end

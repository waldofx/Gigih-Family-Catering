FactoryBot.define do
  factory :menuitem do
    name { "Nasi Uduk" }
    description { "Betawi style steamed rice cooked in coconut milk. Delicious!" }
    price { 10000.0 }
  end

  factory :invalid_menuitem, parent: :menuitem do
    name { nil }
    description { nil }
    price { 10000.0 }
  end
end

# faker
# FactoryBot.define do
#   factory :menuitem do
#     name { Faker::Food.dish }
#     description { Faker::Food.description }
#     price { 10000.0 }
#   end
# end
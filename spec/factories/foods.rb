FactoryBot.define do
  factory :food do
    name { "Nasi Uduk" }
    description { "Betawi style steamed rice cooked in coconut milk. Delicious!" }
    price { 10000.0 }
  end

  factory :invalid_food, parent: :food do
    name { nil }
    description { nil }
    price { 10000.0 }
  end
end

# faker
# FactoryBot.define do
#   factory :food do
#     name { Faker::Food.dish }
#     description { Faker::Food.description }
#     price { 10000.0 }
#   end
# end
FactoryBot.define do
  factory :customer do
    name { "Waldo Felix" }
    phone { "+621234567888" }
    address { "Jakarta" }
    email { "waldofelix2@gmail.com" }
  end

  factory :invalid_customer, parent: :customer do
    name { nil }
    phone { nil }
    address { nil }
    email { nil }
  end
end

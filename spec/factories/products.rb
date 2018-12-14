FactoryBot.define do
  factory :product do
    name { "MyString" }
    description { "MyText" }
    price { "9.99" }
    product_type { nil }
    publisher { nil }
  end
end

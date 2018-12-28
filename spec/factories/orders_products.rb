FactoryBot.define do
  factory :orders_product do
    amount { "" }
    price { "9.99" }
    order { nil }
    product { nil }
  end
end

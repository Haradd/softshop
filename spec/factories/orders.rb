FactoryBot.define do
  factory :order do
    date { "2018-12-14" }
    payment_date { "2018-12-14" }
    price { "9.99" }
    status { "MyString" }
    customer { "" }
    card { "" }
  end
end

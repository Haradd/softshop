FactoryBot.define do
  factory :signup do
    active { false }
    customer_id { "" }
    newsletter_id { "" }
  end
end

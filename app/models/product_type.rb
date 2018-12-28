# frozen_string_literal: true

class ProductType < ApplicationRecord
  self.primary_key = :name

  has_many :products, foreign_key: :product_type_name, inverse_of: :product_type
  has_one :newsletter, foreign_key: :product_types_name, inverse_of: :product_type
end

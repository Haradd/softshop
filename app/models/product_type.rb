# frozen_string_literal: true

class ProductType < ApplicationRecord
  self.primary_key = :name

  has_many :products, foreign_key: :product_type_name, inverse_of: :product_type
end

# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :product_type, foreign_key: :product_type_name, inverse_of: :products
  belongs_to :publisher, foreign_key: :publisher_name, inverse_of: :products

  has_many :wishlist_products, dependent: :destroy
  has_many :wishlists, through: :wishlist_products
end

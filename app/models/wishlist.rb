# frozen_string_literal: true

class Wishlist < ApplicationRecord
  belongs_to :customer

  has_many :wishlist_products
  has_many :products, through: :wishlist_products
end

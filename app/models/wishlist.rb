# frozen_string_literal: true

class Wishlist < ApplicationRecord
  belongs_to :customer

  has_many :wishlists_products, dependent: :destroy
  has_many :products, through: :wishlists_products
end

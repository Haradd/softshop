# frozen_string_literal: true

class WishlistsProduct < ApplicationRecord
  self.primary_key = [:wishlist_id, :product_id]

  belongs_to :product
  belongs_to :wishlist

  validates :order, numericality: { less_than: 999 }
  validates :product, presence: true
  validates :wishlist, presence: true
end

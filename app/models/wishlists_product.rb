# frozen_string_literal: true

class WishlistsProduct < ApplicationRecord
  self.primary_key = [:wishlist_id, :product_id]

  belongs_to :product
  belongs_to :wishlist
end

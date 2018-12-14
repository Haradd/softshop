# frozen_string_literal: true

class WishlistsProduct < ApplicationRecord
  belongs_to :product
  belongs_to :wishlist
end

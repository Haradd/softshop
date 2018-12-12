class Customer < ApplicationRecord
  has_many :cards
  has_many :wishlists
end

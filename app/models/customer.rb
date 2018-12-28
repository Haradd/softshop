# frozen_string_literal: true

class Customer < ApplicationRecord
  has_many :cards, dependent: :destroy
  has_many :wishlists, dependent: :destroy
  has_many :orders, dependent: :destroy

  has_many :signups, dependent: :destroy
  has_many :newsletters, through: :signups
end

# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :product_type, foreign_key: :product_type_name, inverse_of: :products
  belongs_to :publisher, foreign_key: :publisher_name, inverse_of: :products

  has_many :wishlist_products, dependent: :destroy
  has_many :wishlists, through: :wishlist_products

  has_many :orders_products, dependent: :destroy
  has_many :orders, through: :orders_products

  validates :name, presence: true, uniqueness: true, length: { maximum: 50 }
  validates :price, presence: true, numericality: { greater_than: 0, less_than: 9_999_999_999_999.99 }
  validates :product_type, presence: true
  validates :publisher, presence: true

  def to_s
    name
  end
end

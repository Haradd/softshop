# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :card, foreign_key: :card_number, inverse_of: :orders

  has_many :orders_products, dependent: :destroy
  has_many :products, through: :orders_products

  validates :price, presence: true, numericality: { greater_than: 0, less_than: 9_999_999_999_999.99 }
  validates :status, presence: true
  validates :customer, presence: true
  validates :card, presence: true

  def to_s
    id.to_s + ': ' + customer.email
  end
end

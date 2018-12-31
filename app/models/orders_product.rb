# frozen_string_literal: true

class OrdersProduct < ApplicationRecord
  self.primary_key = [:order_id, :product_id]

  belongs_to :order
  belongs_to :product

  validates :amount, presence: true,
                     numericality: { only_integer: true, greater_than: 0, less_than: 9_999_999_999_999.99 }
  validates :price, presence: true, numericality: { greater_than: 0, less_than: 9_999_999_999_999.99 }
  validates :order, presence: true
  validates :product, presence: true

  def to_s
    'order_id: ' + order_id.to_s + ' product_id: ' + product_id.to_s
  end
end

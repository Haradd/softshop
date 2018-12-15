# frozen_string_literal: true

class OrdersProduct < ApplicationRecord
  self.primary_key = [:order_id, :product_id]

  belongs_to :order
  belongs_to :product
end

# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :card, foreign_key: :card_number, inverse_of: :orders
end

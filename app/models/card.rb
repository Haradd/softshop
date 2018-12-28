# frozen_string_literal: true

class Card < ApplicationRecord
  self.primary_key = :number
  belongs_to :customer

  has_many :orders, dependent: :destroy, foreign_key: :card_number, inverse_of: :card
end

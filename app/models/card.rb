# frozen_string_literal: true

class Card < ApplicationRecord
  self.primary_key = :number
  belongs_to :customer

  has_many :orders, dependent: :destroy, foreign_key: :card_number, inverse_of: :card

  validates :number, presence: true, uniqueness: true
  validates :customer, presence: true

  def to_s
    self.customer.to_s + ' : ' + self.number
  end
end

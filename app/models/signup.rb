# frozen_string_literal: true

class Signup < ApplicationRecord
  self.primary_key = [:customer_id, :newsletter_id]

  belongs_to :customer
  belongs_to :newsletter

  validates :active, presence: true, inclusion: { in: [true, false] }
  validates :customer, presence: true
  validates :newsletter, presence: true

  def to_s
    'customer_id: ' + customer_id.to_s + ' newsletter_id: ' + newsletter_id.to_s
  end
end

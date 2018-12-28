# frozen_string_literal: true

class Signup < ApplicationRecord
  self.primary_key = [:customer_id, :newsletter_id]

  belongs_to :customer
  belongs_to :newsletter
end

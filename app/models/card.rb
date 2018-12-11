class Card < ApplicationRecord
  self.primary_key = :number
  belongs_to :customer
end

# frozen_string_literal: true

class Publisher < ApplicationRecord
  self.primary_key = :name
  
  has_many :products, foreign_key: :publisher_name, inverse_of: :publisher
end

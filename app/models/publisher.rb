# frozen_string_literal: true

class Publisher < ApplicationRecord
  self.primary_key = :name

  has_many :products, foreign_key: :publisher_name, inverse_of: :publisher

  validates :name, presence: true, uniqueness: true, length: { maximum: 100 }
  validates :description, length: { maximum: 300 }

  def to_s
    name
  end
end

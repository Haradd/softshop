# frozen_string_literal: true

class Newsletter < ApplicationRecord
  belongs_to :product_type, foreign_key: :product_type_name, inverse_of: :newsletter
  has_many :mails, dependent: :destroy

  has_many :signups, dependent: :destroy
  has_many :customers, through: :signups
end

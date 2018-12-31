# frozen_string_literal: true

class Newsletter < ApplicationRecord
  belongs_to :product_type, foreign_key: :product_type_name, inverse_of: :newsletter
  has_many :mails, dependent: :destroy

  has_many :signups, dependent: :destroy
  has_many :customers, through: :signups

  validates :title, presence: true, length: { maximum: 200 }
  validates :product_type, presence: true

  def to_s
    title
  end
end

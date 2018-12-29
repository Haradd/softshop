# frozen_string_literal: true

class Customer < ApplicationRecord
  has_many :cards, dependent: :destroy
  has_many :wishlists, dependent: :destroy
  has_many :orders, dependent: :destroy

  has_many :signups, dependent: :destroy
  has_many :newsletters, through: :signups

  validates :first_name, presence: true, length: { maximum: 30 }
  validates :last_name, presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 30 }, uniqueness: true
  validates :phone_number, presence: true, length: { in: 9..15 }

  def to_s
    self.first_name + ' ' + self.last_name
  end
end

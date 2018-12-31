# frozen_string_literal: true

class Mail < ApplicationRecord
  belongs_to :newsletter

  validates :text, presence: true
  validates :newsletter, presence: true
end

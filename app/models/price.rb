class Price < ApplicationRecord
  validates :amount, presence: true
  validates :currency, presence: true

  belongs_to :room_type
end
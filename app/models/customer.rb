class Customer < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :ph_no, presence: true, uniqueness: true
  validates :gender, presence: true

  enum gender: [:male, :female], _prefix: true

  has_many :bookings
end

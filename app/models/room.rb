class Room < ApplicationRecord
  validates :room_no, presence: true, uniqueness: true

  enum status: [:available, :not_available], _prefix: true

  belongs_to :room_type
  has_many :bookings

  scope :available_rooms, -> { status_available }
end
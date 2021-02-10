class RoomType < ApplicationRecord
  validates :name, presence: true

  has_many :rooms 
  has_many :prices
end

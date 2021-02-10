class RoomTypeSerializer
  include FastJsonapi::ObjectSerializer
  has_many :prices
  attributes :name
end

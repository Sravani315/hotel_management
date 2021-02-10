class RoomSerializer
  include FastJsonapi::ObjectSerializer
  belongs_to :room_type
  attributes :status
  attributes :room_no do |object|
    "Room No: #{object.room_no}"
  end
end

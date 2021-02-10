FactoryBot.define do
  factory :room do
    id  { Faker::Number.number(digits: 5) }
    room_type
    status { 'available'}
  end
end

def available_room(room_type_name)
  RoomType.find_by(name: room_type_name).rooms.available_rooms.first || create(:room)
end

def unavailable_room
  Room.not_available_rooms.first
end
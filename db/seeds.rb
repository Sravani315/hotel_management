['Single', 'Double', 'Triple', 'Quad', 'Queen'].each_with_index do |room_type_name, i|
  room_type = RoomType.create(name: room_type_name)
  room_type.prices.create(amount: i+1*4000, currency: 'INR')
  (1..10).each { |room_no| room_type.rooms.create(room_no: ((i+1)*10 - room_no).to_s) }
end

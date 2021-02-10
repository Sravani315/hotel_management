class BookingSerializer
  include FastJsonapi::ObjectSerializer
  belongs_to :customer
  belongs_to :room
  attributes :check_in, :check_out
end

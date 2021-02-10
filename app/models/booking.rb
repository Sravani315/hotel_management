class Booking < ApplicationRecord
  self.table_name = :booking

  belongs_to :room
  belongs_to :customer
end

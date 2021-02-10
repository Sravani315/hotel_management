module Api::V1
  class RoomsController < ApiController
    before_action :find_room, except: :index
    before_action :validate_check_in_params, only: :check_in
    before_action :validate_check_out_params, only: :check_out
    
    def index
      rooms = Room.available_rooms
      rooms = rooms.page(params[:page]).per(params[:per_page])
      render_data(RoomSerializer.new(rooms, { :include => [:room_type] }))
    end

    def check_in
      @booking = @room.bookings.new(check_in_params)
      @booking.check_in = Time.now
      
      if @bookings.save
        render_data(BookingSerializer.new(@booking, { :include => [:room, :customer]}))
      else
        render_activemodel_errors(@booking)
      end
    end

    def check_out
      @booking.check_out = Time.now
      
      if @bookings.save
        render_data(render_data(BookingSerializer.new(@booking, { :include => [:room, :customer]})))
      else
        render_activemodel_errors(@booking)
      end
    end

    private

    def validate_check_in_params
      errors = []
      customer = Customer.find(params[:customer_id])
      error << "Room has already booked" if @room.status_not_available
      render_error(errors) if errors.any?
    end

    def validate_check_in_params
      errors = []
      @booking = @room.bookings.last
      error << "Room has not booked" if @room.status_available
      error << "Customer has already vacated this Room" if @bookings.check_out.present?
      render_error(errors) if errors.any?
    end

    def check_in_params
      params.permit(:customer_id)
    end
    
    def room
      @room = Room.find(params[:id])
    end 
  end
end
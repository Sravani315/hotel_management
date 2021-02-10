require 'rails_helper'

RSpec.describe "GET /api/v1/rooms", type: :request do
  context "for listing available rooms with differenct prices" do
    before do
      get "/api/v1/rooms"
    end
    it "returns with success" do
      expect(response).to have_http_status(:success)
    end
    it "returns list of available rooms" do
      expect(response.body.size).to be > 0
    end
  end
end

RSpec.describe "POST /api/v1/rooms/:id/check_in", type: :request do
  before do
    @room = available_room('Single')
    @customer = get_customer
    @params = { :customer_id => @customer.id }
  end
  
  context "check-in to a valid room" do
    context "with invalid parameter" do
      before do
        post "/api/v1/rooms/#{@room.id}/check_in", params: {:customer_id => rand(100)}
      end
      it "returns not found error" do
        expect(response).to have_http_status(:not_found)
      end
    end
    context "with valid parameter" do
      before do
        post "/api/v1/rooms/#{@room.id}/check_in", params: @params
      end
      it "returns success" do
        expect(response).to have_http_status(:success)
      end
    end
  end

  context "check-in to a invalid room" do
    before do
      post "/api/v1/rooms/#{rand(100)}/check_in", params: @params
    end
    it "returns not fund error" do
      expect(response).to have_http_status(:not_found)
    end
  end
end

RSpec.describe "POST /api/v1/rooms/:id/check_out", type: :request do
  before do
    @available_room = available_room('Single')
    @room = unavailable_room
  end
  
  context "check-out a valid room" do
    context "with valid parameter" do
      before do
        post "/api/v1/rooms/#{@room.id}/check_out"
      end
      it "returns success" do
        expect(response).to have_http_status(:success)
      end
    end
  end
  
  context "check-in to a invalid room" do
    before do
      post "/api/v1/rooms/#{rand(100)}/check_out"
    end
    it "returns not found error" do
      expect(response).to have_http_status(:not_found)
    end
  end
end
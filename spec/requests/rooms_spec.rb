require 'rails_helper'

RSpec.describe "GET /api/v1/rooms", type: :request do
  context "without parameters" do
    before do
      get "/api/v1/rooms"
    end
    it "returns with success" do
      expect(response).to have_http_status(:success)
    end
    # it "returns first_name cannot be blank" do
    #   p response
    #   expect(response).to have_http_status(200)
    # end
  end
  # context "with valid parameters" do
  #   it "works! (now write some real specs)" do
  #     get customers_path
  #     expect(response).to have_http_status(200)
  #   end
  # end
end
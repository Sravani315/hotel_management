require 'rails_helper'

# RSpec.describe "POST /api/v1/customers", type: :request do
#   context "with invalid parameters" do
#     context "with invalid first_name" do
#       before do
#         post "/api/v1/customers", params: {}
#       end
#       it "returns bad request error" do
#         expect(response).to have_http_status(:bad_request)
#       end
#     end
#   end
#   context "with valid parameters" do
#     it "works! (now write some real specs)" do
#       get customers_path
#       expect(response).to have_http_status(200)
#     end
#   end
# end

RSpec.describe "GET /api/v1/customers", type: :request do
  context "with parameters" do
    before do
      get "/api/v1/customers", params: {}
    end
    it "returns with success" do
      expect(response).to have_http_status(:success)
    end
    it "returns list of customers" do
      expect(response.body.size).to be >= 0
    end
  end
  context "with valid parameters" do
    before do
      get "/api/v1/customers", params: { first_name: 'Example', last_name: 'Rspec', gender: 'male'}
    end
    it "returns with success" do
      expect(response).to have_http_status(:success)
    end
    it "returns list of customers" do
      expect(response.body.size).to be >= 0
    end
  end
  context "with invalid parameters" do
    before do
      get "/api/v1/customers", params: { first_name: 'Example', last_name: 'Rspec', gender: 'male'}
    end
    it "returns with bad request error" do
      expect(response).to have_http_status(:bad_request)
    end
    it "returns with gender cannot be in a given range" do
      expect(response.body).to include('Gender cannot be in a given range')
    end
  end
end


# RSpec.describe "POST /api/hiring_party/queries", :type => :request do
  
#   context "for unauthorized user" do
#     it "returns with unauthorized error" do
#       post '/api/hiring_party/queries'
#       expect(response).to have_http_status(:unauthorized)
#     end
#   end
#   context "for hiring party user" do
#     context 'with invalid parameters' do
#       context 'with invalid machine type' do
#         before do
#           @params[:machines][0][:machine_type_id] = SecureRandom.uuid
#           post '/api/hiring_party/queries', headers: auth_headers(@hiring_party_user), params: @params
#         end
#         it 'returns with bad request error' do
#           expect(response).to have_http_status(:bad_request)
#         end
#         it 'returns machine type must exist' do
#           expect( json['errors'][0]['title']).to eq("Machine type must exist")
#         end
#       end
#       context 'with invalid machine subtype' do
#         before do
#           @params[:machines][0][:machine_subtype_id] = SecureRandom.uuid
#           post '/api/hiring_party/queries', headers: auth_headers(@hiring_party_user), params: @params
#         end
#         it 'returns with bad request error' do
#           expect(response).to have_http_status(:bad_request)
#         end
#         it 'returns machine subtype must exist' do
#           expect( json['errors'][0]['title']).to eq("Machine subtype must exist")
#         end
#       end
#       context 'with invalid machine property id' do
#         before do
#           @property_id = SecureRandom.uuid
#           @params[:machines][0][:machine_properties] = { @property_id => "10 Ton" }
#           post '/api/hiring_party/queries', headers: auth_headers(@hiring_party_user), params: @params
#         end
#         it 'returns with bad request error' do
#           expect(response).to have_http_status(:bad_request)
#         end
#         it 'returns invalid variant' do
#           expect( json['errors'][0]['title']).to include("Machine variant must exist")
#         end
#         it 'returns invalid rate' do
#           expect( json['errors'][1]['title']).to include("Machine rate must exist")
#         end
#         it 'returns invalid property' do
#           expect( json['errors'][2]['title']).to include("Invalid property #{@property_id}")
#         end
#       end
#     end
#     context 'with valid parameters' do
#       before do
#       post '/api/hiring_party/queries', headers: auth_headers(@hiring_party_user), params: @params
#       end
#       it 'returns with success' do
#         expect(response).to have_http_status(:success)
#       end
#       it "returns created query details" do
#         expect(json['data'][0]).to be_a(Hash)
#       end
#     end
#   end
# end

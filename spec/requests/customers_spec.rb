require 'rails_helper'

RSpec.describe "GET /api/v1/customers", type: :request do
  context "without parameters" do
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
      get "/api/v1/customers", params: { :first_name => 'Example', :last_name => 'Rspec', :gender => 'male' }
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
      get "/api/v1/customers", params: { :first_name => 'Example', :last_name => 'Rspec', :gender => 'ecma' }
    end
    it "returns with bad request error" do
      expect(response).to have_http_status(:bad_request)
    end
    it "returns with gender cannot be in a given range" do
      expect(response.body).to include('Gender cannot be in a given range')
    end
  end
end

RSpec.describe "POST /api/v1/customers", type: :request do
  context "with invalid parameters" do
    context "with invalid first_name" do
      before do
        post "/api/v1/customers", params: {}
      end
      it "returns bad request error" do
        expect(response).to have_http_status(:bad_request)
      end
      it "returns First name cannot be blank message" do
        expect(response.body).to include("First name can't be blank")
      end
    end
    context "with invalid last_name" do
      before do
        post "/api/v1/customers", params: {}
      end
      it "returns bad request error" do
        expect(response).to have_http_status(:bad_request)
      end
      it "returns Last name cannot be blank message" do
        expect(response.body).to include("Last name can't be blank")
      end
    end
    context "with invalid ph_no" do
      before do
        post "/api/v1/customers", params: {}
      end
      it "returns bad request error" do
        expect(response).to have_http_status(:bad_request)
      end
      it "returns Phone number cannot be blank message" do
        expect(response.body).to include("Ph no can't be blank")
      end
    end
    context "with invalid email" do
      before do
        post "/api/v1/customers", params: {}
      end
      it "returns bad request error" do
        expect(response).to have_http_status(:bad_request)
      end
      it "returns Email can't be blank message" do
        expect(response.body).to include("Email can't be blank")
      end
    end
  end

  context "with valid parameters" do
    before do
      post "/api/v1/customers", params: {:first_name => 'Ex', :last_name => 'User', :gender => 'male' , :ph_no => "9899090990", :email => "exuser@gmail.com" }
    end
    it "returns success" do
      expect(response).to have_http_status(:success)
    end
    it "returns customer details" do
      expect(response.body).to include("User")
    end 
  end
end

RSpec.describe "PATCH /api/v1/customers/:id", type: :request do
  
  context "for valid customer" do
    before do
      @customer = get_customer
      @params = {:first_name => 'Example1', :last_name => 'User', :gender => 'male' , :ph_no => "9899090990", :email => "exuser@gmail.com" }
    end

    context "with valid parameters" do
      before do
        patch "/api/v1/customers/#{@customer.id}", params: @params
      end
      it "returns success" do
        expect(response).to have_http_status(:success)
      end
      it "returns updated customer details" do
        expect(response.body).to include(@params[:first_name])
      end
    end

    context "with invalid gender" do
      before do
        @params[:gender] = "ecma"
        patch "/api/v1/customers/#{@customer.id}", params: @params
      end
      it "returns bad request error" do
        expect(response).to have_http_status(:bad_request)
      end
      it "returns Gender cannot be in a given range erroe" do
        expect(response.body).to include("Gender cannot be in a given range")
      end
    end
  end

  context "for invalid customer" do
    before do
      patch "/api/v1/customers/#{rand(1000)}", params: @params
    end
    it "returns not found error" do
      expect(response).to have_http_status(:not_found)
    end
    it "returns Record not found message" do
      expect(response.body).to include("Record not found")
    end 
  end
end
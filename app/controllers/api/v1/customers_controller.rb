module Api::V1
  class CustomersController < ApiController
    before_action :find_customer, except: :index
    before_action :validate_params
    
    def index
      customers = Customer.all
      customers = filter_customers(customers, filters)
      customers = customers.page(params[:page]).per(params[:per_page])
      render_data(CustomerSerializer.new(customers))
    end

    def create
      @customer = Customer.new(customer_params)

      if @customer.save
        render_data(CustomerSerializer.new(@customer, {}))
      else
        render_activemodel_errors(@customer)
      end
    end

    def update
      @customer = Customer.new(customer_params)

      if @customer.save
        render_data(CustomerSerializer.new(@customer, {}))
      else
        render_activemodel_errors(@customer)
      end
    end

    private

    def filter_customers(customers, search_filters)
      if search_filters[:first_name].present?
        customers = customers.where('first_name ILIKE (?)', search_filters[:first_name])
      end

      if search_filters[:last_name].present?
        customers = customers.where('last_name ILIKE (?)', search_filters[:last_name])
      end

      if search_filters[:gender].present?
        customers = customers.where(gender: search_filters[:gender])
      end

      return customers
    end

    def validate_params
      errors = []

      if params[:gender].present? && Customer.genders.key?(params[:gender])
        errors << "Gender cannot be in a given range"
      end

      render_error(errors) if errors.any?
    end

    def filters
      params.permit(:first_name, :last_name, :gender)
    end

    def customer_params
      params.params(:first_name, :last_name, :gender, :ph_no, :email)
    end
    
    def find_customer
      @customer = Customer.find(params[:id])
    end 
  end
end
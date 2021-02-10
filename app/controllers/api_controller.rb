class ApiController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, :with => :render_404

  def render_error(error, status = :bad_request)
    error = { errors: error }
    render_data(error, status)
  end

  def render_activemodel_errors(errors)
    render_error( model.errors.full_messages.join(','), :bad_request)
  end

  def render_404
    render_error("Record not found",  :not_found)
  end

  def render_data(data, status = :ok)
    render json: data, status: status
  end
end
class ApplicationController < ActionController::API
  before_action :validate_api_key!

  private

  def valid_api_key?
    request.headers['x-Api-Key'] == Rails.application.credentials.api_key
  end

  def validate_api_key!
    return if valid_api_key?

    render json: {
      status: 'ERROR',
      message: 'incorrect api key'
    }, status: :forbidden
  end
end

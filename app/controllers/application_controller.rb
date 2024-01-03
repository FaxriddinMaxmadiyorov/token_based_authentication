class ApplicationController < ActionController::Base
  include JsonWebToken

  before_action :authenticate_request

  private

  def authenticate_request
    header = request.headers['Authorization']
    header = headers.split(' ').last if headers
    decoded = jwt_decode(header)
    @current_user = User.find(decoded[:user_id])
  end
end

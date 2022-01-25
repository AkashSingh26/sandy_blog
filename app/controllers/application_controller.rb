class ApplicationController < ActionController::API
  before_action :authorize
  def authorize
    secret_key = Rails.application.secrets.secret_key_base[0]
    token = request.headers["authorization"]
    begin
      decoded_data = JWT.decode(token, secret_key)

      user = User.find_by(id: decoded_data[0]["user_id"])

      if user
        true
      else
        render json: {status: :unauthorized}
      end
    rescue
       render json: {status: :unauthorized}
    end
  end
end

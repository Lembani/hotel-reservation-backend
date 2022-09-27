class ApplicationController < ActionController::API
  respond_to :json
  before_action :update_allowed_parameters, if: :devise_controller?

  def logged_in
    render json: { error: 'You are not logged in!' }, status: :forbidden unless !!current_user
  end

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation) }
    devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:email, :password) }
  end

  def after_sign_in_path_for(_resource)
    api_v1_hotels_path
  end
end

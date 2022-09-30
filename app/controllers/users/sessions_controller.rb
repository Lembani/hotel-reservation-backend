class Users::SessionsController < Devise::SessionsController
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    resource.persisted? ? respond_to_on_create : respond_to_on_create_fail
  end

  def respond_to_on_create
    render json: { message: 'Login successful!', user: resource, error: resource.errors },
           status: :ok
  end

  def respond_to_on_create_fail
    render json: { message: 'Invalid username or password!', error: resource.errors }, status: :unauthorized
  end

  def respond_to_on_destroy
    current_user.present? ? log_out_failure : log_out_success
  end

  def log_out_success
    render json: { message: 'Logged out.' }, status: :ok
  end

  def log_out_failure
    render json: { message: 'Logout failure!', error: resource.errors }, status: 400
  end
end

class Users::SessionsController < Devise::SessionsController
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    resource.persisted? ? respond_to_on_create : respond_to_on_create_fail
  end

  def respond_to_on_create
    render json: { message: 'Login successful!', error: resource.errors }, status: :ok
  end

  def respond_to_on_create_fail
    render json: { message: 'Login failed!', error: resource.errors }
  end

  def respond_to_on_destroy
    current_user ? log_out_success : log_out_failure
  end

  def log_out_success
    render json: { message: 'Logged out.' }, status: :ok
  end

  def log_out_failure
    render json: { message: 'Logout failure!' }, status: :unauthorized
  end
end

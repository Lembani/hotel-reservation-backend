class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    resource.persisted? ? register_success : register_failed
  end

  def register_success
    render json: { message: 'Signed up successfully!' }
  end

  def register_failed
    render json: { message: 'Sign up failure!', error: resource.errors }
  end
end

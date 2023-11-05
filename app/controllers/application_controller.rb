class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_bloguser!
  before_action :load_and_authorize_resource

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name email password password_confirmation photo bio])
  end

  private

  def load_and_authorize_resource
    # Load and authorize resources as needed
  end

  def current_ability
    @current_ability ||= ::Ability.new(current_bloguser)
  end
end

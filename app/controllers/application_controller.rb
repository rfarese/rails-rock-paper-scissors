class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def require_login
    unless user_signed_in?
      flash[:notice] = "You must be signed in"
      redirect_to new_user_session_path
    end
  end
  helper_method :require_login
end

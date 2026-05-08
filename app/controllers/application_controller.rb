class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!


  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes

  protected

  def authenticate_admin_user!
    authenticate_user!
    unless current_user.admin?
      redirect_to root_path, alert: "Access denied! Only admins can access the dashboard."
    end
  end

  def require_admin!
    unless current_user&.admin?
      redirect_to root_path, alert: "Access denied! Only admins can access this page."
    end
  end

  def require_broker!
    unless current_user&.broker?
      redirect_to root_path, alert: "Access denied! Only brokers can access this page."
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :name, :phone_number, :role ])
    devise_parameter_sanitizer.permit(:account_update, keys: [ :name, :phone_number, :role ])
  end
end

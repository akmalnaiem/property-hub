class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!


  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [ :name, :phone_number, :role ])
      devise_parameter_sanitizer.permit(:account_update, keys: [ :name, :phone_number, :role ])
    end
end

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :user_has_parts, :user_has_builds

  def user_has_parts
    !current_user.parts_lists.empty?
  end

  def user_has_builds
    !current_user.builds.empty?
  end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    end

end
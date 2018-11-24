class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :user_has_parts

  def user_has_parts
    !current_user.parts_lists.empty?
  end

  def list_belongs_to_current_user?
    pl.user == current_user
  end


  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    end

end
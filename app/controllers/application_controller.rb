class ApplicationController < ActionController::Base

  
  
  before_action :configure_permitted_parameters, if: :devise_controller?

  # ユーザー
  def after_sign_in_path_for(resource)
    case resource
    when User
      posts_path
    when Admin
      admin_homes_top_path
    end
  end
  
  def after_sign_out_path_for(resource)
    case resource
    when :user
      root_path
    when :admin
      new_admin_session_path
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:family_name, :first_name, :family_relationship, :disply_name])
  end

end
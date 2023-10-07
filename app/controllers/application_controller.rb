class ApplicationController < ActionController::Base
  #before_action :authenticate_customer!, except: [:top], unless: :admin_signed_in?
  #before_action :authenticate_admin!, if: :admin_namespace?

  #private

  #def admin_namespace?
    #controller_path.start_with?('admin/')
  #end

  # ログイン後の遷移先
  #def after_sign_in_path_for(resource)
   #root_path
  #end

  #def after_sign_out_path_for(resource)
    #root_path
  #end
end

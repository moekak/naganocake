class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number])
  end

  def after_sign_in_path_for(resource)
    admin_items_path # ログイン後に遷移したいパス
  end
  def after_sign_out_path_for(resource_or_scope)
    new_admin_session_path #ここを好きなパスに変更
  end



end

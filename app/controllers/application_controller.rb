class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected
  def configure_permitted_parameters
    # ユーザー登録時にuser_nameのストロングパラメータを追加
    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name])
    # ユーザー編集時にuser_nameと、user_introduction,user_image のストロングパラメータを追加
    devise_parameter_sanitizer.permit(:account_update, keys: [:user_name, :user_introduction, :user_image])
  end

end

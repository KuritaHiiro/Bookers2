class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:about, :top]

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :user_check, only:[:edit, :update]

  def after_sign_in_path_for(resource)
    user_path(current_user.id)
  end

  def after_sign_out_path_for(resource)
    "/"
  end

  def user_check
    if current_user = @user
      @user = User.find(params[:id])
      redirect_to user_path(current_user)
    end
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:[:name, :email])
  end

end

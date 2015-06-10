class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new user_params
    respond_to do |format|
      if @user.save
        format.html {redirect_to root_path, notice: I18n.t(:user_success_created)} 
      else
        format.html {render :new}
      end
    end
  end

  private
  def user_params
    params.require(:user).permit :name, :email, :password, :password_confirmation
  end
end
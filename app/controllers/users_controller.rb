class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find_by(id: params[:id])
  end

  def destroy
    User.find(params[:id]).destroy
    session[:user_id] = nil
    flash[:success] = "Account successfuly deleted!"
    redirect_to root_path
  end

end
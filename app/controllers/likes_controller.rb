class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_build

 def create
  if already_liked?
    flash[:message] = "Already Liked"
  else
   @build.likes.create(user_id: current_user.id)
   
  end
 end

  def destroy
  @user = current_user
  @build.likers.delete @user
  
  end
   
 private
 
  def find_build
    @build = Build.find(params[:build_id])
  end

  def already_liked?
    Like.where(user_id: current_user.id, build_id:
    params[:build_id]).exists?
  end
end
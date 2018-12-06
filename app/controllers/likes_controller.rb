class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_build 

 def create
   @build.likes.create(user_id: current_user.id)
   redirect_to build_path(@build)
 end

 private
 
  def find_build
    @build = Build.find_by_id(params[:id])
  end

end
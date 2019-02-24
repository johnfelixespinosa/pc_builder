class BuildsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_build, only: [:show, :edit, :update, :destroy]
  before_action :need_parts_list_to_build, only: [:new]

  def index_all
    @builds = Build.send(params[:search])
    render :all
  end
  
  def index_builds
    @user = User.find_by(id: params[:user_id])
    @builds = Build.find_by(id: params[:id])
    render :index
  end

  def show
    respond_to do |f|
      f.html { render :show }
      f.json { render json: @build }
    end
  end

  def new
    @build = Build.new
  end

  def create
    @build = current_user.builds.new(build_params)
    if @build.save
      redirect_to(user_builds_path(current_user), flash: { success: "Build Created!" })
    else      
      redirect_to(new_user_build_path(current_user), flash: { message: "Something went wrong, try again!" })
    end
  end

  def edit
  end

  def update
    if @build.user == current_user
      @build.update(build_params)
      if @build.save
        redirect_to(user_builds_path(current_user), flash: { success: "Your Build #{@build.title} was successfully updated!" })
      else
        redirect_to(edit_user_build_path(current_user, @build), flash: { message: "Something went wrong, try again!" })
      end
    else
      flash[:message] = "You don't have permission to do that"
      redirect_to root_path
    end
  end

  def destroy
    if @build.user == current_user
      @build.delete
      flash[:success] = "Build deleted!"
      redirect_to user_builds_path(current_user)
    else
      flash.now[:message] = "You don't have permision to do that!"
      redirect_to root_path
    end
  end

  private

    def build_params
      params.require(:build).permit(
        :title,
        :description,
        :parts_list_id,
        images: []
      )
    end

    def find_build
      @build = Build.find_by_id(params[:id])
    end

    def need_parts_list_to_build
      if current_user.has_no_parts?
        redirect_to user_parts_lists_path
      else
        @build = current_user.builds.new
      end
    end

end

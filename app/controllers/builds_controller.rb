class BuildsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_build, only: [:show, :edit, :update, :destroy]
  before_action :need_parts_list_to_build, only: [:new]

  def index_all
    @builds = Build.all
    render :all
  end
  
  def index_builds
    @user = User.find_by(id: params[:user_id])
    @builds = Build.find_by(id: params[:id])
    render :index
  end

  def show
  end

  def new
  end

  def create
    @build = Build.new(build_params)
    if @build.save
      current_user.builds << @build
      redirect_to user_builds_path(current_user)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
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
      if !current_user.has_parts?
        redirect_to user_parts_lists_path
      else
        @build = current_user.builds.new
      end
    end

end

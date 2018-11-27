class BuildsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_list, only: [:show, :edit, :update, :destroy]
  before_action :need_parts_list_to_build, only: [:new]

  def index_all
    @builds = Build.all
    render :all
  end
  
  def index_builds
    @builds = Build.find_by(id: params[:id])
    render :index
  end

  def show
  end

  def new
  end

  def create
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
        render 'new'
      end
    end

end

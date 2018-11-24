class BuildsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_list, only: [:show, :edit, :update, :destroy]

  def index_all
    @builds = Build.all
    render :all # or something else
  end
  
  def index_builds
    @builds = Build.find_by(id: params[:id])
    render :index # or something else
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

end

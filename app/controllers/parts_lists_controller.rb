class PartsListsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_list, only: [:show, :edit, :update, :destroy]

  def index
  end

  def new
    @parts_list = PartsList.new
  end

  def create
    @parts_list = current_user.parts_lists.build(parts_list_params)
    if @parts_list.save
      flash[:success] = "Parts List Added!"
      redirect_to user_parts_list_path(@parts_list)
    else
      flash.now[:message] = "<strong>Please try again. There were some errors:</strong><br>"
      render :new
    end
  end

  def show
  end

  private

    def parts_list_params
      params.require(:parts_list).permit(
        :name, 
        :cpu, 
        :cpu_cooler, 
        :motherboard, 
        :storage, 
        :video_card, 
        :case, 
        :power_supply, 
        :operating_system, 
        :monitor
      )
    end

    def find_list
      @parts_list = PartsList.find_by_id(params[:id])
    end

end

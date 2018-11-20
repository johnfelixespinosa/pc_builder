class PartsListsController < ApplicationController

  def index
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

end

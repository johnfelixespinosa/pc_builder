class PartsListsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_list, only: [:edit, :update, :destroy]
  before_action :find_user

  def index
    @user = User.find_by(id: params[:user_id])
    if params[:user_id]
      @parts_lists = User.find(params[:user_id]).parts_lists
      respond_to do |f|
        f.html {render :index}
        f.json {render json: @parts_lists}
      end
    else
      @user = current_user
      @parts_lists = PartsList.all
    end
  end

  def new
    @parts_list = PartsList.new
  end

  def create
    @parts_list = current_user.parts_lists.build(parts_list_params)
    if @parts_list.save
      redirect_to(user_parts_lists_path(current_user), flash: { success: "Parts List Added!" })
    else
      
      render "new" 
      # redirect_to(new_user_parts_list_path(current_user), flash: { message: "Something went wrong, try again!" })
    end
  end

  def edit
  end

  def update
    if @parts_list.user == current_user
      @parts_list.update(parts_list_params)
      if @parts_list.save
        redirect_to(user_parts_lists_path(current_user), flash: { success: "Your list #{@parts_list.name} was successfully updated!" })
      else
        redirect_to(new_user_parts_list_path(current_user), flash: { message: "Something went wrong, try again!" })
      end
    else
      flash[:message] = "You don't have permission to do that"
      redirect_to root_path
    end
  end

  def destroy
    if @parts_list.user == current_user
      @parts_list.delete
      flash[:success] = "List deleted!"
      redirect_to user_parts_lists_path(current_user)
    else
      flash.now[:message] = "You don't have permision to do that!"
      redirect_to root_path
    end
  end

  private

    def parts_list_params
      params.require(:parts_list).permit(
        :name, 
        :cpu, 
        :cpu_cooler, 
        :motherboard,
        :ram, 
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

    def find_user
      @user = current_user
    end

end
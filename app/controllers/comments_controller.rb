class CommentsController < ApplicationController
  before_action :find_build

  def index
    @comments = @build.comments.all
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @comments }
    end
  end

  def new
    @comment = @build.comments.build(user_id: current_user.id)
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      render json: @comment, status: 201
    else
      render 'new'
    end
  end

  private
    
    def find_build
      @build = Build.find_by_id(params[:build_id])
    end

    def comment_params
      params.require(:comment).permit(
        :body,
        :user_id,
        :build_id
        )
    end

end

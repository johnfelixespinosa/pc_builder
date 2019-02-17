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
    @comment = Comment.new
  end

  def create
    @comment = @build.comments.build(comment_params)
    if @comment.save
      redirect_to build_path(@build)
    else
      redirect_to root_path
    end
  end

  private
    
    def find_build
      @build = Build.find_by_id(params[:build_id])
    end

    def comment_params
      params.require(:comment).permit(
        :body,
        :user_id
        )
    end

end

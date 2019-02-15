class CommentsController < ApplicationController
  before_action :find_build

  def new
    @comment = Comment.new
  end

  def create
    @comment = @build.comments.build(comment_params)
    if @comment.save
      respond_to do |format|
        format.html do
          flash[:success] = 'Comment posted.'
          redirect_to @build
        end
        format.js # JavaScript response
      end
    else
      redirect_to root_path
      flash[:error] = "Something went wrong"
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

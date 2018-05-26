class CommentsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user, only: [:destroy]

  def create
    @micropost = Micropost.find(params[:micropost_id])
    @comment = @micropost.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      flash[:success] = "Comment created!"
      redirect_to request.referrer || root_url
    else
      flash[:danger] = "Invalid comment!"
      redirect_to request.referrer || root_url
    end
  end

  def destroy
    @comment.destroy
    flash[:success] = "Comment deleted"
    redirect_to request.referrer || root_url
  end

  private

    def comment_params
      params.require(:comment).permit(:content)
    end

    def correct_user
      micropost = Micropost.find(params[:micropost_id])
      @comment = micropost.comments.find(params[:id])
      redirect_to request.referrer || root_url if @comment.nil?
    end
end

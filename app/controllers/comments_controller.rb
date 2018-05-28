class CommentsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user, only: [:destroy]

  def create
    @micropost = Micropost.find(params[:micropost_id])
    @comment = @micropost.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      respond_to do |format|
        format.html {
          flash[:success] = "Comment created!"
          redirect_to request.referrer || root_url
        }
        format.js
      end
    else
      flash[:danger] = "Comment cannot be blank or longer than 300 characters!"
      #respond_to do |format|
      #  format.html { redirect_to request.referrer || root_url }
      #  format.js
      #end
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html {
        flash[:success] = "Comment deleted"
        redirect_to request.referrer || root_url
      }
      format.js
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:content)
    end

    def correct_user
      @micropost = Micropost.find(params[:micropost_id])
      @comment = @micropost.comments.find(params[:id])
      redirect_to request.referrer || root_url if @comment.nil?
    end
end

class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @micropost = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page], per_page: 10)
      @feed_items.each do |feed_item|
        @comments = feed_item.comments
        @comment = Comment.new
      end
    end
  end

  def help
  end

  def about
  end

  def contact
  end
end

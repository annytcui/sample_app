require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @comment = comments(:pork)
    @micropost = microposts(:orange)
    @user = users(:anny)
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Comment.count' do
      post micropost_comments_path(@micropost), params: {
          comment: {
          content: "Lorem ipsum",
          micropost_id: @micropost.id,
          user_id: @user.id
        } }
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Comment.count' do
      delete micropost_comment_path(@comment.micropost, @comment)
    end
    assert_redirected_to login_url
  end
end

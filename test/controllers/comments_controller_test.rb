require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @comment = comments(:pork)
    @micropost = microposts(:orange)
    @user = users(:anny)
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Comment.count' do
      post comments_path, params: {
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
      delete comment_path(@comment)
    end
    assert_redirected_to login_url
  end
end

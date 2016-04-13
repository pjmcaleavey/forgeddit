require "test_helper"

class CommentsControllerTest < ActionController::TestCase
  def sign_in(user)
    session[:user_id] = users(user).id
  end

  def sign_out(user)
    session[:user_id] = nil
  end

  test "can create a comment" do
    sign_in(:booger)
    post :create, comment: { body: "Hello" }
    assert_redirected_to post_path
  end
end

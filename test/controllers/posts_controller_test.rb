require "test_helper"

class PostsControllerTest < ActionController::TestCase
  def sign_in(user)
    session[:user_id] = users(user).id
  end

  def sign_out(user)
    session[:user_id] = nil
  end

  test "can display all posts" do
    get :index
    assert_response :ok
    assert_template :index
  end

  test "can display a post form for logged in user" do
    sign_in(:booger)
    get :new
    assert_response :ok
    assert_template :new
  end

  # test "can destroy a post" do
  #   sign_in(:booger)
  #   delete :destroy { id: :posts(:booger).id }
  #
  #   assert_response :ok
  # end

  # test "can destroy a post" do
  #   sign_in(:whoever)
  #   count_before_deleting = Post.count
  #   delete :destroy ....
  #   assert Post.count < count_before_deleting
  # end

  # test "user gets directed to root after a post is deleted" do
  #   sign_in(:booger)
  #   assert_redirected_to root_path
  # end

end

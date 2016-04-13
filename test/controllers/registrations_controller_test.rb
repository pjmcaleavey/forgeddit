require "test_helper"

class RegistrationsControllerTest < ActionController::TestCase
  test "can display a registration form" do
    get :new
    assert_response :ok
    assert_template :new
  end

  # test "can create a new user" do
  #   assert_difference("User.count") do
  #   post :create, {
  #     first_name: "Booger",
  #     last_name: "Unknown",
  #     email: "booger@lambda.com",
  #     password: "nerds"
  #   }
  # end
  #   #assert_response :ok #DOESN'T PASS - WHY?
  #   assert_redirected_to login_path
  # end
  #THESE DO THE SAME ^^

  test "can create a new user" do
    post :create, user: {
      first_name: "Booger",
      last_name: "Unknown",
      email: "booger@lambda.com",
      password: "nerds"
    }
    assert_redirected_to login_path
  end

  test "failed user gets redirected to register" do
    post :create, user: {
      first_name: "Booger",
      last_name: "Unknown",
      email: "booger@lambda.com",
      password: "no whitespace nerd"
    }
  assert_redirected_to register_path##FAILS, REDIRECTED TO LOGIN_PATH (SUCCESS)
  #assert_template :new
  end
end

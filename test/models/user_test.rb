require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "user can't have a password with whitespace" do
    @user = User.new(password: "Shouldn't work")
    refute @user.valid?
    @user = User.new(password: "ShouldWork")
    assert true
  end
end

# create_table "users", force: :cascade do |t|
#   t.string   "first_name"
#   t.string   "last_name"
#   t.string   "email"
#   t.string   "password"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
# end

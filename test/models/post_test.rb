require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "post title must be between 4-20 characters" do
    @post = Post.new(title: "no")
    refute @post.valid?
    @post = Post.new(title: "uh hu")
    assert @post.valid?
  end
end

# create_table "posts", force: :cascade do |t|
#   t.integer  "user_id"
#   t.string   "title"
#   t.string   "link_url"
#   t.string   "timestamp"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
# end

require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "comment must have characters in it" do
    @comment = Comment.new(body: "")
    refute @comment.valid?
    @comment = Comment.new(body: "words")
    assert true
  end
end


# create_table "comments", force: :cascade do |t|
#   t.integer  "post_id"
#   t.text     "body"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
#   t.integer  "user_id"
# end

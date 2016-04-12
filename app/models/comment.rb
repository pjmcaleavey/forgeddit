class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  validates :body, format: {
    with: /\A.+\z/,
    message: "enter a comment"
  }

end

class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  validates :title, format: {
    with: /\A.{4,20}\z/,
    message: "must be between 4-20 characters"
  }
end

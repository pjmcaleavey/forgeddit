class User < ActiveRecord::Base
  has_many :posts
  has_many :comments


  validates :password, format: {
    with: /\A[\S]*$\z/,
    message: "cannot contain whitespace"
  }
end

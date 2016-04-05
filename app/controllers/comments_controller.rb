class CommentsController < ApplicationController
  before_action :authenticate!

  def create
    @post = Post.find(params[:id])
    @post.comments.create(body: params[:body], user_id: current_user.id)
    redirect_to post_path(@post)
  end

  def destroy
    #binding.pry
    @post = Post.find(params[:id])
    comment = Comment.find(params[:comment_id])
    #binding.pry
    if current_user.id == comment.user_id
      #binding.pry
      comment.destroy
    else
      flash[:notice] = "You can only delete your comments."
    end
    redirect_to post_path(params[:id])
  end
end

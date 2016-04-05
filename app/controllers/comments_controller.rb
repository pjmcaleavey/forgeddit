class CommentsController < ApplicationController
  def create
    authenticate!
    @post = Post.find(params[:id])
    @post.comments.create(body: params[:body], user_id: current_user.id)
    redirect_to post_path(@post)
  end
end

class PostsController < ApplicationController
  def index
    @posts = Post.all
    # render :index
  end

  def new
    # render :new
  end

  def show
    #comments
  end

  def create
    @post = current_user.posts.new(user_id: session[:user_id], title: params[:title],
                     link_url: params[:link_url])
    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])
    binding.pry
    if current_user.id == @post.user_id
      @post.destroy
    else
      puts "You can only delete your posts."
    end
  end
end

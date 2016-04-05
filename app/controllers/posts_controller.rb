class PostsController < ApplicationController
  def index
    @posts = Post.all
     render :index
  end

  def new
    authenticate!
     #render :new
  end

  def show
    #make sure starts w http/https
    #link_url = params["url"]
    #link_url = "http://" + link_url unless link_url =~ #/^http(s)?:regex
    @post = Post.find(params["id"])
    render :show
  end

  def create
    authenticate!
    @post = current_user.posts.new(user_id: session[:user_id], title: params[:title],##describe
                     link_url: params[:link_url])
    if @post.save
      redirect_to posts_path(@post)##describe
    else
      render :new
    end
  end

  def destroy
    authenticate!
    @post = Post.find(params[:id])
    if current_user.id == @post.user_id
      @post.destroy
    else
      flash[:notice] = "You can only delete your posts."
    end
    redirect_to :root
  end
end

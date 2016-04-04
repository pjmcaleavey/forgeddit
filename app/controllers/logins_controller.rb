class LoginsController < ApplicationController
  def new
    render :new
  end

  def create
    @user = User.find_by(email: params[:email], password: params[:password])
    if @user
      session[:user_id] = @user.id#look up details on session #explain this line
      flash[:notice] = "Welcome #{@user.first_name}"
      redirect_to :root
    else
      flash[:notice] = "Email and password do not match."##NEVER GOES AWAY#details on flash #does this on logout?
      redirect_to login_path #render :new ??
    end
  end

  def destroy
    flash[:notice] = "You successfully logged out."
    session[:user_id] = nil
    redirect_to :root
  end
end



# session = { user_id: nil }
# session[:user_id] = @user.id

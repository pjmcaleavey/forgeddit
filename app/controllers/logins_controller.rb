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
      flash[:notice] = "Email and password do not match."##NEVER GOES AWAY  #details on flash
      redirect_to login_path #render :new ??
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
    flash[:notice] = "#{@user.first_name} logged out."##NOTHING
  end
end



# session = { user_id: nil }
# session[:user_id] = @user.id

class LoginsController < ApplicationController
  def new
    render :new
  end

  def create
    @user = User.find_by(email: params["email"], password: params["password"])
    if @user
      session[:user_id] = @user.id
      flash[:notice] = "Welcome #{@user.first_name}"
      redirect_to :root
    else
      flash[:notice] = "Email and password do not match."
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end
end



# session = { user_id: nil }
# session[:user_id] = @user.id

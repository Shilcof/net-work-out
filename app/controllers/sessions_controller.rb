class SessionsController < ApplicationController
  before_action :redirect_if_logged_in, only: [:new, :create]
  skip_before_action :redirect_if_not_permitted, only: [:new, :create]

  def new
  end

  def create
    @user = User.find_by(username: params[:user][:username])
    if @user && @user.authenticate(params[:user][:password])
      login(@user)
      redirect_to profile_path(@user.username)
    else
      redirect_to login_path
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end
end

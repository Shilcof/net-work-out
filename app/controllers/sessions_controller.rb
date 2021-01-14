class SessionsController < ApplicationController
  skip_before_action :redirect_if_not_logged_in, only: [:new, :create]
  before_action :redirect_if_logged_in, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:user][:username])
    if @user && @user.authenticate(params[:user][:password])
      login(@user)
      redirect_to @user
    else
      @user = User.new
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end
end

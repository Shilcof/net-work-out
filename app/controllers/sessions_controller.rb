class SessionsController < ApplicationController
  before_action :redirect_if_logged_in, only: [:new, :create]
  skip_before_action :redirect_if_not_permitted, only: [:new, :create]
  skip_before_action :redirect_if_username_required, only: [:edit, :update, :destroy]
  skip_before_action :set_object

  def new
  end

  def create
    @user = User.find_by_username_or_email(params[:user][:username])
    if @user && @user.authenticate(params[:user][:password])
      login(@user)
      redirect_to profile_path(@user.username)
    else
      redirect_to login_path, flash: { alert: "Invalid username, email, or password" }
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(complete_params)
    if @user.save
      redirect_to profile_path(@user.username)
    else
      render :edit
    end
  end

  def omniauth
    @user = User.from_omniauth(auth)
    byebug
    if @user.valid?
      login(@user)
      redirect_to profile_path(@user.username)
    elsif @user.errors.size == @user.errors[:username].size
      login(@user)
      redirect_to complete_signup_path(@user)
    else
      redirect_to login_path, flash: { alert: "Log in with google failed" }
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end

  private

  def complete_params
    params.require(:user).permit(:admin_requested, :username)
  end

  def auth
    request.env['omniauth.auth']
  end
end

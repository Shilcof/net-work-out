class UsersController < ApplicationController
    before_action :set_user_by_username, only: [:show, :edit]
    before_action :redirect_if_logged_in, only: [:new, :create]
    skip_before_action :redirect_if_not_permitted, only: [:new, :create]
    before_action :redirect_if_not_admin, only: [:index]

    def index
        @users = User.all
    end
    
    def new
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
            login(@user)
            redirect_to profile_path(@user.username)
        else
            redirect_to signup_path
        end
    end
    
    def show
    end
    
    def edit # require current user or admin check
        redirect_if_not_permitted
    end
    
    def update # require current user or admin checks
        @user.update(user_params)
        if @user.save
            redirect_to profile_path(@user.username)
        else
            render :edit
        end
    end
    
    def destroy # require current user or admin check -- delete dependant workouts, but not muscles & exercises
        @user.destroy
        redirect_to users_path
    end

    private

    def user_params
        params.require(:user).permit(:username, :password, :password_confirmation, :admin)
    end

    def set_user_by_username
        @user = User.find_by_username(params[:username])
    end
end

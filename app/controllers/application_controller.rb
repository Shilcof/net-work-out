class ApplicationController < ActionController::Base
    before_action :redirect_if_not_logged_in

    private

    def current_user
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end
    
    helper_method :current_user

    def current_uri
        @current_uri ||= request.env['PATH_INFO']
    end
    
    helper_method :current_uri

    def login(user)
        session[:user_id] = user.id
    end

    def redirect_if_not_logged_in
        return redirect_to root_path unless current_user
    end

    def redirect_if_logged_in
        return redirect_to root_path if current_user
    end

    def redirect_if_not_admin
        if !current_user.admin
            if request.method == "GET"
                render 'layouts/error'
            else
                return redirect_to root_path
            end
        end
    end

end

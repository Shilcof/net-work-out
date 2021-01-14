module ApplicationHelper

    def current_user
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def current_uri
        @current_uri ||= request.env['PATH_INFO']
    end

end

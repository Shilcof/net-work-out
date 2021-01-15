module ApplicationHelper

    def current_user
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def logged_in?
        !!current_user
    end

    def admin?
        current_user ? current_user.admin : false
    end

    def current_uri
        @current_uri ||= request.env['PATH_INFO']
    end

    def permission_to_edit?(object)
        if object.class == User
            object == current_user || admin?
        else
            object.try(:user_id) == current_user.id || admin?
        end
    end

    def permission_to_view?(object)
        logged_in? ? permission_to_edit?(object) : false
    end

end

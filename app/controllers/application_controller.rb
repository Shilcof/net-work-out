class ApplicationController < ActionController::Base
    before_action :redirect_if_not_logged_in

    include ApplicationHelper

    private

    def login(user)
        session[:user_id] = user.id
    end

    def redirect_to_root
        return redirect_to root_path
    end

    def redirect_if_not_logged_in
        redirect_to_root unless current_user
    end

    def redirect_if_logged_in
        redirect_to_root if current_user
    end

    def redirect_if_not_admin
        if !current_user.admin
            if request.method == "GET"
                render 'layouts/page_not_found', status: 404
            else
                redirect_to_root
            end
        end
    end

end

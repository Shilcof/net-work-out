class ApplicationController < ActionController::Base
    before_action :redirect_if_not_logged_in
    before_action :set_object

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

    def set_object
        if params[:id]
            object = _prefixes[0].singularize
            instance = object.capitalize.constantize.find(params[:id])
            instance_variable_set("@#{object}", instance)
        end
    end

    def get_object
        if params[:id]
            object = _prefixes[0].singularize
            instance_variable_get("@#{object}")
        end
    end

    def permission_to_edit?(object)
        if object.class == User
            object == current_user
        else
            object.try(user_id) == current_user.id
        end
    end

end

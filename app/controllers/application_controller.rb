class ApplicationController < ActionController::Base
    before_action :set_object, :redirect_if_not_permitted

    include ApplicationHelper

    private

    def login(user)
        session[:user_id] = user.id
    end

    def page_not_found
        return render 'errors/page_not_found', status: 404
    end

    def redirect_to_root
        return redirect_to root_path
    end

    def redirect_if_logged_in # Login, Signup
        redirect_to_root if logged_in?
    end

    def redirect_if_not_admin # Admin actions (including /users) - skip redirect_if_not_permitted and add this
        if !admin?
            if request.method == "GET"
                page_not_found
            else
                redirect_to_root
            end
        end
    end

    def redirect_if_not_permitted # All non get requests and edit routes if not logged in and no permission to edit
        if !admin?
            if request.method != "GET"
                redirect_to_root unless logged_in? && permitted # Malicious post requests
            elsif action_name == "edit"
                page_not_found unless logged_in? && permitted # Not permitted to edit this resource error add
            elsif action_name == "new"
                page_not_found unless logged_in? # Log in to create this resource error add
            end
        end
    end

    def permitted
        get_object ? permission_to_edit?(get_object) : true
    end

    def set_object
        if params[:id]
            object = _prefixes[0].singularize
            instance = object.capitalize.constantize.find(params[:id])
            instance_variable_set("@#{object}", instance)
        end
    end

    def get_object
        if params[:id] || params[:username]
            object = _prefixes[0].singularize
            instance_variable_get("@#{object}")
        end
    end

end

module AdminRequestHelper
    def admin_button(user)
        if user.admin_request
            button_to "Accept admin request", admin_request_path(user.admin_request.id), method: :patch, class: "btn btn-outline-success btn-block"
        elsif user.admin
            button_to "Revoke admin status", admin_request_path(user.id), method: :delete, class: "btn btn-outline-success btn-block"
        end 
    end
end

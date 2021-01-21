class AdminRequestsController < ApplicationController
    skip_before_action :redirect_if_not_permitted, :set_object
    before_action :redirect_if_not_admin

    def update
        ar = AdminRequest.find(params[:id])
        ar.user.update(admin: true)
        ar.destroy
        redirect_to users_path
    end

    def destroy
        User.find(params[:id]).update(admin: false)
        redirect_to users_path
    end
end

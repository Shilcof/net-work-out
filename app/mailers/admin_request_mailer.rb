class AdminRequestMailer < ApplicationMailer
    def admin_granted_email
      @user = params[:ar].user
      mail(to: @user.email, subject: "Admin rights have been granted")
    end
end

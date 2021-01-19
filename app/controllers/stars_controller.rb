class StarsController < ApplicationController
  skip_before_action :redirect_if_not_permitted, :set_object

  def create
    object = params[:class].constantize.find(params[:id])
    current_user.stars.create(starable: object)
    redirect_to params[:uri]
  end
end

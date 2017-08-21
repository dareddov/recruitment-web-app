class RegardsSendController < ApplicationController

  def create
    service = RegardsSend.call(params[:recipient_id], current_user.id)

    if service
      redirect_to :users, flash: { success: t('.success') }
    else
      redirect_to :users, flash: { error: t('.failure') }
    end
  end
end

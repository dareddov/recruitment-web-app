class UsersController < ApplicationController
  require 'csv'

  def index
    @q = User.all.ransack(params[:q])
    @users = @q.result.decorate
  end

  def send_regards
    service = RegardsSender.call(params, current_user)

    if service
      redirect_to :users, notice: t('.success')
    end
  end

  def export
    @users = User.all.decorate

    respond_to do |format|
      format.csv do
        headers['Content-Disposition'] = "attachment; filename=\"users\""
        headers['Content-Type'] ||= 'text/csv'
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to :users, notice: t('.success', email: @user.email)
  end
end

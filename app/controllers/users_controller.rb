class UsersController < ApplicationController
  require 'csv'

  def index
    @q = User.all.ransack(params[:q])
    @users = @q.result.decorate

    respond_to do |format|
      format.html {  }
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

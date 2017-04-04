class UsersController < ApplicationController
  def index
    @users = User.all.decorate
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to :users, notice: t('.success', email: @user.email)
  end
end

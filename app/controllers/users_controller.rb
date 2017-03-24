class UsersController < ApplicationController
  expose :user
  expose_decorated(:users, -> { User.all })

  def destroy
    user.destroy
    redirect_to :users, notice: t('.success', email: user.email)
  end
end

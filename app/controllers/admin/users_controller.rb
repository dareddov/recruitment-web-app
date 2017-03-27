class Admin::UsersController < Admin::BaseController
  expose :user
  expose :interests, from: :user
  expose_decorated(:users, -> { User.all })

  def create
    user.password = 'secret'

    if user.save
      redirect_to [:admin, :users], notice: t('.success', email: user.email)
    else
      render 'new'
    end
  end

  def update
    if user.update_attributes(user_params)
      redirect_to [:admin, :users], notice: t('.success', email: user.email)
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :age, :gender, interests_attributes: [:id, :name, :interest_type, :_destroy])
  end
end

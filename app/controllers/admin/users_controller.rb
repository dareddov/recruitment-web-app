class Admin::UsersController < Admin::BaseController
  def index
    @users = User.all.decorate
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.password = 'secret'

    if @user.save
      redirect_to [:admin, :users], notice: t('.success', email: @user.email)
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      redirect_to [:admin, :users], notice: t('.success', email: @user.email)
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :age, :gender, interests_attributes: [:id, :name, :interest_type, :_destroy])
  end
end

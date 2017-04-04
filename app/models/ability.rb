class Ability
  include CanCan::Ability

  def initialize(user)
     user ||= User.new

      if user.is_admin?
        can :manage, User
        cannot :destroy, User, id: user.id
      end
  end
end
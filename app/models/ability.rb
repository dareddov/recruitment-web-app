class Ability
  include CanCan::Ability

  def initialize(user)
     user ||= User.new

      if user.is_admin?
        can :manage, User
        cannot :destroy, User, id: user.id
      else
        can :send_regards, User
      end
  end
end

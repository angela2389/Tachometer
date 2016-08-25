class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    # Can READ anything
    can :manage, :all

    if user.persisted? # in db, so logged in
      can :manage, :all if user.role == "admin"
      # Can MANAGE (create, read, update, destroy, etc.) own Post
      can :manage, Project, user: user
      can :manage, Phase
    end
  end
end

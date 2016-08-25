class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    # Can READ anything
    can :manage, :all

    if user.persisted? # in db, so logged in
      if user.role == "admin"
      can :manage, :all
      can :access, :rails_admin
      can :dashboard
      # Can MANAGE (create, read, update, destroy, etc.) own Post
      else
      can :create, :all
      can :manage, Project, user: user
      can :manage, Phase
      end
    end
  end
end

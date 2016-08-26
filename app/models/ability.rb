class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    # Can READ anything
      can :read, :all
    if user.persisted? # in db, so logged in
      if user.role == "coach"
      can :manage, :all
      can :access, :rails_admin
      can :dashboard
      # Can MANAGE (create, read, update, destroy, etc.) own POST
      else
      can :create, :all
      can :manage, Project, user: user
      can :manage, Phase
      can :manage, Experiment
      can :manage, Sprint
      can :manage, Team
      can :manage, TeamMember
      can :manage, Step
      end
    end
  end
end

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    # Can READ anything
    can :manage, :all

    if user.persisted? # in db, so logged in
      # Can MANAGE (create, read, update, destroy, etc.) own Post
      can :manage, :all if TeamMember.find_by(user_id: user.id).role == "Product Owner"
      # can :manage, Phase, user: user
      # can :manage, Team, user: user
      # can :manage, Spring, user: user
      # can :manage, Experiment, user: user
    end
  end
end

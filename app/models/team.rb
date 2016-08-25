class Team < ApplicationRecord
  has_one :project, through: :phase
  belongs_to :phase
  has_many :users, through: :team_members
  has_many :team_members
  has_many :experiments

  ROLES = ["Product Owner", "Advisor", "Team Member", "Coach"]

  def manager
    self.team_members.find { |x| x.role == Team::ROLES[0] }
  end
end

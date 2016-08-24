class Team < ApplicationRecord
  belongs_to :phase
  has_many :users, through: :team_members
  has_many :team_members
  has_many :experiments

  ROLE = ["Product Owner", "Advisor", "Team Member", "Coach"]
end

class TeamMember < ApplicationRecord
  has_one :project, through: :team
  belongs_to :team
  belongs_to :user
end

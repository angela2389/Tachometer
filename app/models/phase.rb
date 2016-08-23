class Phase < ApplicationRecord

  belongs_to :project
  has_one :team
  has_many :sprints

  def name
    Project::STAGES[self.sequence]
  end

end

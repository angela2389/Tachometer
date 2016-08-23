class Phase < ApplicationRecord

  belongs_to :project
  has_one :team

  def name
    Project::STAGES[:sequence]
  end

end

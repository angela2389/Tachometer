class Phase < ApplicationRecord

  def name
    Project::STAGES[:sequence]
  end
  
end

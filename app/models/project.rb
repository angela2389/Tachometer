class Project < ApplicationRecord

  has_many :phases

  STAGES = ['Explore', 'Experiment', 'Grow', 'Scale']
  
end

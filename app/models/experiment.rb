class Experiment < ApplicationRecord
  belongs_to :phase
  belongs_to :sprint
  belongs_to :team
end

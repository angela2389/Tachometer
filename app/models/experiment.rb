class Experiment < ApplicationRecord
  belongs_to :phase
  belongs_to :sprint
  belongs_to :team

  def interviews_completion
    number = self.interviews_done - self.interviews_planned
    ratio = number / self.interviews_planned
    {number: number, ratio: ratio}
  end

  def early_adopters_conversion
    number = self.early_adopters_converted - self.early_adopters_planned
    ratio = number / self.early_adopters_planned
    {number: number, ratio: ratio}
  end


end

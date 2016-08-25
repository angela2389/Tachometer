class Experiment < ApplicationRecord
  belongs_to :phase
  has_and_belongs_to_many :sprint
  belongs_to :team
  has_many :steps

  before_save :add_default_values

  def interviews_completion
    number = self.interviews_done - self.interviews_planned
    ratio = number.to_f / ( self.interviews_planned != 0 ? self.interviews_planned : 1 )
    {number: number, ratio: ratio}
  end

  def early_adopters_conversion
    number = self.early_adopters_converted - self.early_adopters_planned
    ratio = number.to_f / ( self.early_adopters_planned != 0 ? self.early_adopters_planned : 1 )
    {number: number, ratio: ratio}
  end

  def add_default_values
    self.interviews_planned ||= 0
    self.interviews_done ||= 0
    self.early_adopters_converted ||= 0
    self.early_adopters_planned ||= 0
  end

end

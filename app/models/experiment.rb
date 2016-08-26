class Experiment < ApplicationRecord
  belongs_to :phase
  has_and_belongs_to_many :sprints
  belongs_to :team
  has_many :steps

  before_save :add_default_values

  def ratio_completion_1
    number = self.act_succes_metric_1
    ratio = number.to_f / ( self.target_succes_metric_1 != 0 ? self.target_succes_metric_1 : 1 )
    {number: number, ratio: ratio}
  end

  def ratio_completion_2
    number = self.act_succes_metric_2
    ratio = number.to_f / ( self.target_succes_metric_2 != 0 ? self.target_succes_metric_2 : 1 )
    {number: number, ratio: ratio}
  end

  def ratio_completion_3
    number = self.act_succes_metric_3
    ratio = number.to_f / ( self.target_succes_metric_3 != 0 ? self.target_succes_metric_3 : 1 )
    {number: number, ratio: ratio}
  end

  def ratio_completion_4
    number = self.act_succes_metric_4
    ratio = number.to_f / ( self.target_succes_metric_4 != 0 ? self.target_succes_metric_4 : 1 )
    {number: number, ratio: ratio}
  end

  def ratio_completion_5
    number = self.act_succes_metric_5
    ratio = number.to_f / ( self.target_succes_metric_5 != 0 ? self.target_succes_metric_5 : 1 )
    {number: number, ratio: ratio}
  end

  def add_default_values
    self.act_succes_metric_1 ||= 0
    self.act_succes_metric_2 ||= 0
    self.act_succes_metric_3 ||= 0
    self.act_succes_metric_4 ||= 0
    self.act_succes_metric_5 ||= 0
    self.target_succes_metric_1 ||= 0
    self.target_succes_metric_2 ||= 0
    self.target_succes_metric_3 ||= 0
    self.target_succes_metric_4 ||= 0
    self.target_succes_metric_5 ||= 0
  end

end

class Sprint < ApplicationRecord
  belongs_to :phase
  has_and_belongs_to_many :experiments

  before_save :default_values

  def default_values
    self.completed ||= false
  end

end

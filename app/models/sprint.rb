class Sprint < ApplicationRecord
  belongs_to :phase
  has_and_belongs_to_many :experiments

  accepts_nested_attributes_for :experiments, allow_destroy: true, :reject_if => :all_blank

  before_save :default_values

  def default_values
    self.completed ||= false
  end

end

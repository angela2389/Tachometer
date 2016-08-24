class Sprint < ApplicationRecord
  belongs_to :phase
  has_many :experiments
end

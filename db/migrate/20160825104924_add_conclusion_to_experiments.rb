class AddConclusionToExperiments < ActiveRecord::Migration[5.0]
  def change
    add_column :experiments, :conclusion, :boolean
  end
end

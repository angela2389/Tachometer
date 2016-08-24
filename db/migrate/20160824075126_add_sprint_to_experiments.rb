class AddSprintToExperiments < ActiveRecord::Migration[5.0]
  def change
    add_reference :experiments, :sprint, foreign_key: true
  end
end

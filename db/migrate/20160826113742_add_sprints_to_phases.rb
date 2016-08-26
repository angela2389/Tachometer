class AddSprintsToPhases < ActiveRecord::Migration[5.0]
  def change
    add_column :phases, :sprints, :integer
  end
end

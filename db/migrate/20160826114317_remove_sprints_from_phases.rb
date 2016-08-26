class RemoveSprintsFromPhases < ActiveRecord::Migration[5.0]
  def change
    remove_column :phases, :sprints, :integer
  end
end

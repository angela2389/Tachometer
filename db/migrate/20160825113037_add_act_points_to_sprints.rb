class AddActPointsToSprints < ActiveRecord::Migration[5.0]
  def change
    add_column :sprints, :act_points, :integer
  end
end

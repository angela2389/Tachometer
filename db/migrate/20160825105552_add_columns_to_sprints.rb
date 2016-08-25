class AddColumnsToSprints < ActiveRecord::Migration[5.0]
  def change
    add_column :sprints, :things_done, :text
    add_column :sprints, :things_learned, :text
    add_column :sprints, :est_points, :integer
    add_column :sprints, :avg_happy, :float
    add_column :sprints, :on_target, :integer
    add_column :sprints, :organization_helping, :integer
    add_column :sprints, :able_to_pull_of, :integer
    add_column :sprints, :impediment, :text
  end
end

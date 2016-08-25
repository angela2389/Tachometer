class RemoveForeignKeyForSprintInExpirements < ActiveRecord::Migration[5.0]

  def up
    remove_foreign_key :experiments, column: :sprint_id
  end

  def down
    add_foreign_key :experiments, :sprints, column: :sprint_id
  end

end

class AddCurrentStageIdToProjects < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :current_stage_id, :integer
  end
end

class AddRetroActionsToSprints < ActiveRecord::Migration[5.0]
  def change
    add_column :sprints, :retro_actions, :text
  end
end

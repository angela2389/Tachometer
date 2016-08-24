class AddCompletedToPhases < ActiveRecord::Migration[5.0]
  def change
    add_column :phases, :completed, :boolean
  end
end

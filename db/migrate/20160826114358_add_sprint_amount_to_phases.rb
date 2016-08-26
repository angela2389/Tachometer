class AddSprintAmountToPhases < ActiveRecord::Migration[5.0]
  def change
    add_column :phases, :sprint_amount, :integer
  end
end

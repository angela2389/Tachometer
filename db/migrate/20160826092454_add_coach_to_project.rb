class AddCoachToProject < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :coach_id, :integer
  end
end

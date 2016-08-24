class AddPortfoliomanagerToProject < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :portfoliomanager_id, :integer
  end
end

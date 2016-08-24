class AddColumnsToExperiment < ActiveRecord::Migration[5.0]
  def change
    add_column :experiments, :domain, :string
    add_column :experiments, :assumption, :text
    add_column :experiments, :method, :text
    add_column :experiments, :observation, :text
    add_column :experiments, :measure, :text
    add_column :experiments, :learned, :text
    add_column :experiments, :success_criteria, :text
    add_column :experiments, :action, :text
    add_column :experiments, :interviews_planned, :integer
    add_column :experiments, :interviews_done, :integer
    add_column :experiments, :early_adopters_planned, :integer
    add_column :experiments, :early_adopters_converted, :integer
  end
end

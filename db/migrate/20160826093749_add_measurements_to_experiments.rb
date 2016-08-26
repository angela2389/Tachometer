class AddMeasurementsToExperiments < ActiveRecord::Migration[5.0]
  def change
    add_column :experiments, :metric_1, :string
    add_column :experiments, :target_succes_metric_1, :integer
    add_column :experiments, :act_succes_metric_1, :integer
    add_column :experiments, :metric_2, :string
    add_column :experiments, :target_succes_metric_2, :integer
    add_column :experiments, :act_succes_metric_2, :integer
    add_column :experiments, :metric_3, :string
    add_column :experiments, :target_succes_metric_3, :integer
    add_column :experiments, :act_succes_metric_3, :integer
    add_column :experiments, :metric_4, :string
    add_column :experiments, :target_succes_metric_4, :integer
    add_column :experiments, :act_succes_metric_4, :integer
    add_column :experiments, :metric_5, :string
    add_column :experiments, :target_succes_metric_5, :integer
    add_column :experiments, :act_succes_metric_5, :integer
  end
end

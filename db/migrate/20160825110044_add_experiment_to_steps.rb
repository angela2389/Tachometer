class AddExperimentToSteps < ActiveRecord::Migration[5.0]
  def change
    add_reference :steps, :experiment, foreign_key: true
  end
end

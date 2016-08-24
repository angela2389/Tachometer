class AddTeamToExperiments < ActiveRecord::Migration[5.0]
  def change
    add_reference :experiments, :team, foreign_key: true
  end
end

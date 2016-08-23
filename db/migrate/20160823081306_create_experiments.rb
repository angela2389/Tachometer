class CreateExperiments < ActiveRecord::Migration[5.0]
  def change
    create_table :experiments do |t|
      t.string :name
      t.date :start_date
      t.date :end_date
      t.boolean :completed

      t.timestamps
    end
  end
end

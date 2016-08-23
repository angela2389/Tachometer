class CreatePhases < ActiveRecord::Migration[5.0]
  def change
    create_table :phases do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.integer :interval
      t.integer :sequence
      t.text :long_term_vision
      t.text :kpi_s
      t.text :criteria
      t.text :bottlenecks
      t.text :problem_definition
      t.text :solutions
      t.text :long_term
      t.text :key_benefits
      t.text :vision
      t.text :test_first
      t.text :proof_of_value
      t.text :background
      t.text :note

      t.timestamps
    end
  end
end

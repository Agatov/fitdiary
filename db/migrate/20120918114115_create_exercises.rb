class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.integer :workout_id
      t.integer :gymnastic_id
      t.integer :pid, default: 0
      t.integer :timeout
      t.text :comment

      t.timestamps
    end
  end
end

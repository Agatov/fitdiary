class CreateExerciseSets < ActiveRecord::Migration
  def change
    create_table :exercise_sets do |t|
      t.integer :exercise_id
      t.integer :pid, default: 0
      t.float :weight
      t.integer :repeats

      t.timestamps
    end
  end
end

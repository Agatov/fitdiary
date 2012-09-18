class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.integer :user_id
      t.date :date
      t.text :comment

      t.timestamps
    end
  end
end

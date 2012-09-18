class CreateGymnastics < ActiveRecord::Migration
  def change
    create_table :gymnastics do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end

class CreateWorkouts < ActiveRecord::Migration[6.1]
  def change
    create_table :workouts do |t|
      t.string :name
      t.string :information
      t.boolean :public
      t.boolean :published
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class AddMuscleToExercises < ActiveRecord::Migration[6.1]
  def change
    add_reference :exercises, :muscle, null: false, foreign_key: true
  end
end

class ChangeColumnExerciseIdForWorkoutExercise < ActiveRecord::Migration[6.1]
  def change
    change_column :workout_exercises, :workout_id, :integer, :null => true
  end
end

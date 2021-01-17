class WorkoutExercise < ApplicationRecord
  belongs_to :workout
  belongs_to :exercise

  def _destroy=(v)
  end
end

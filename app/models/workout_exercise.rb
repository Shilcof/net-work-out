class WorkoutExercise < ApplicationRecord
  belongs_to :workout
  belongs_to :exercise
  validates :exercise_id, :sets, :reps, presence: true
end

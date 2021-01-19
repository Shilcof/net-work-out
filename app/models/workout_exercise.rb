class WorkoutExercise < ApplicationRecord
  belongs_to :workout
  belongs_to :exercise
  validates :exercise_id, :sets, :reps, presence: true, numericality: { only_integer: true, greater_than: 0, less_than: 31 }
end

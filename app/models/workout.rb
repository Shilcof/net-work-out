class Workout < ApplicationRecord
  belongs_to :user
  has_many :workout_exercises
  has_many :exercises, through: :workout_exercises
  validates :name, :information, presence: true

  accepts_nested_attributes_for :workout_exercises, allow_destroy: true

  # def workout_exercises_attributes=(workout_exercises_attributes)
  #   workout_exercises_attributes.each do |i, attributes|
  #     attributes[:exercise_number] = i.to_i
  #     workout_exercises.build(attributes) if attributes[:exercise_id].present? && attributes[:sets].present? && attributes[:reps].present? && attributes[:_destroy] == "0"
  #   end
  # end

  # def write_workout_exercises(workout_exercises_attributes)
  #   workout_exercises_attributes.values[0].each do |i, attributes|
  #     attributes[:exercise_number] = i.to_i
  #     workout_exercises.build(attributes) if attributes[:_destroy] == "0"
  #   end
  # end
end

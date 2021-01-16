class Workout < ApplicationRecord
  belongs_to :user
  has_many :workout_exercises
  has_many :exercises, through: :workout_exercises

  # accepts_nested_attributes_for :workout_exercises #write custom

  def workout_exercises_attributes=(workout_exercises_attributes)
    workout_exercises.each{ |we| we.destroy }
    workout_exercises_attributes.each do |i, attributes|
      attributes[:exercise_number] = i.to_i
      self.workout_exercises.build(attributes) if attributes[:exercise_id].present?
    end
  end
end

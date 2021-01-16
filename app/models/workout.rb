class Workout < ApplicationRecord
  belongs_to :user
  has_many :workout_exercises
  has_many :exercises, through: :workout_exercises

  # accepts_nested_attributes_for :workout_exercises #write custom

  def workout_exercises_attributes=(workout_exercises_attributes)
    workout_exercises.each{ |we| we.destroy }
    workout_exercises_attributes.each_with_index do |attributes, i|
      attributes[exercise_number] = i
      workout_exercises.each.create(attributes)
    end
  end
end

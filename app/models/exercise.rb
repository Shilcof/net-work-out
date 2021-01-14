class Exercise < ApplicationRecord
    has_many :workout_exercises
    has_many :workouts, through: :workout_exercises
    belongs_to :muscle

    accepts_nested_attributes_for :muscle, reject_if: proc { |attributes| attributes[:name].blank? || attributes[:information].blank? }
end

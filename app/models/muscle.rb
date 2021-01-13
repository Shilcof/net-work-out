class Muscle < ApplicationRecord
    has_many :exercises
    has_many :workouts, through: :exercises
end

class Workout < ApplicationRecord
  belongs_to :user
  has_many :workout_exercises
  has_many :exercises, through: :workout_exercises
  has_many :muscles, through: :exercises

  validates :name, :information, presence: true

  accepts_nested_attributes_for :workout_exercises, allow_destroy: true

  scope :latest, -> (query){order(created_at: :desc).limit(query)}
end

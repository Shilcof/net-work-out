class Workout < ApplicationRecord
  belongs_to :user
  has_many :workout_exercises
  has_many :exercises, through: :workout_exercises
  has_many :muscles, through: :exercises

  has_many :stars, as: :starable
  has_many :starred_users, through: :stars, source: :user

  validates :name, :information, presence: true, no_symbols: true

  accepts_nested_attributes_for :workout_exercises, allow_destroy: true

  scope :latest, -> (query){order(created_at: :desc).limit(query)}
  scope :search, -> (query){where("LOWER(name) LIKE LOWER(?)", "%#{query}%")}
  scope :muscles_search, -> (query){joins(:exercises).where('exercises.muscle_id': query)}
  scope :exercises_search, -> (query){joins(:workout_exercises).where('workout_exercises.exercise_id': query)}
end

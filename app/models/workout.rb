class Workout < ApplicationRecord
  belongs_to :user
  has_many :workout_exercises
  has_many :exercises, through: :workout_exercises
  has_many :muscles, through: :exercises

  has_many :stars, as: :starable
  has_many :starred_users, through: :stars, source: :user

  validates :name, :information, presence: true, no_symbols: true

  accepts_nested_attributes_for :workout_exercises, allow_destroy: true

  scope :featured, -> {joins(:stars).group(:'starable_id').order("count(starable_id) DESC").limit(1)}
  
  scope :most_starred_by_time, -> (query, time){joins(:stars).where("stars.created_at > ?", time).group(:'starable_id').order("count(starable_id) DESC").limit(query)}
  scope :most_starred, -> (query){joins(:stars).group(:'starable_id').order("count(starable_id) DESC").limit(query).distinct}
  scope :latest, -> (query){order(created_at: :desc).limit(query).distinct}
  scope :search, -> (query){query.present? ? where("LOWER(workouts.name) LIKE LOWER(?)", "%#{query}%") : self}
  scope :muscles_search, -> (query){query.present? ? joins(:exercises).where('exercises.muscle_id': query) : self}
  scope :exercises_search, -> (query){query.present? ? joins(:workout_exercises).where('workout_exercises.exercise_id': query) : self}
end

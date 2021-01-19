class Muscle < ApplicationRecord
    has_many :exercises
    has_many :workouts, through: :exercises
    
    validates :name, :information, no_symbols: true, presence: true
    validates :name, uniqueness: true

    validates :name, length: { in: 3..30 }
    validates :information, length: { in: 50..2000 }

    scope :search, -> (query){where("LOWER(name) LIKE LOWER(?)", "%#{query}%")}
end

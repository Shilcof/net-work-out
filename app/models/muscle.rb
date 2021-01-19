class Muscle < ApplicationRecord
    has_many :exercises, :dependent => :destroy
    has_many :workouts, through: :exercises

    has_many :stars, as: :starable
    
    validates :name, :information, no_symbols: true, presence: true
    validates :name, uniqueness: true

    validates :name, length: { in: 3..30 }
    validates :information, length: { in: 50..2000 }

    scope :search, -> (query){where("LOWER(name) LIKE LOWER(?)", "%#{query}%")}
end

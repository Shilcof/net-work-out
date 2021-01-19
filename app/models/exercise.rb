class Exercise < ApplicationRecord
    has_many :workout_exercises
    has_many :workouts, through: :workout_exercises
    belongs_to :muscle
    
    validates :name, :information, no_symbols: true, presence: true
    validates :name, uniqueness: true

    validates :name, length: { in: 3..30 }
    validates :information, length: { in: 50..2000 }

    accepts_nested_attributes_for :muscle, reject_if: proc { |attributes| attributes[:name].blank? || attributes[:information].blank? }

    def muscle_attributes=(muscle_attributes)
        if muscle_attributes[:name].present? && muscle_attributes[:information].present?
            @muscle = Muscle.find_by_name(muscle_attributes[:name])
            @muscle = @muscle || Muscle.new(muscle_attributes)
            self.muscle = @muscle
        end
    end

    scope :search, -> (query){where("LOWER(name) LIKE LOWER(?)", "%#{query}%")}
end

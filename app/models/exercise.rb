class Exercise < ApplicationRecord
    has_many :workout_exercises, :dependent => :destroy
    has_many :workouts, through: :workout_exercises
    belongs_to :muscle

    has_many :stars, as: :starable
    has_many :starred_users, through: :stars, source: :user

    has_one_attached :image
    
    validates :name, :information, no_symbols: true, presence: true
    validates :name, uniqueness: true

    validates :name, length: { in: 3..30 }
    validates :information, length: { in: 50..2000 }

    def muscle_attributes=(muscle_attributes)
        if muscle_attributes[:name].present? && muscle_attributes[:information].present?
            @muscle = Muscle.find_by_name(muscle_attributes[:name])
            @muscle = @muscle || Muscle.new(muscle_attributes)
            self.muscle = @muscle
        end
    end

    scope :search, -> (query){where("LOWER(name) LIKE LOWER(?)", "%#{query}%")}
end

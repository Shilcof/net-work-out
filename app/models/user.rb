class User < ApplicationRecord
    has_many :workouts
    has_many :stars
    has_many :starred_workouts, through: :stars, source: 'starable', source_type: 'Workout'
    has_many :starred_exercises, through: :stars, source: 'starable', source_type: 'Exercise'
    has_many :starred_muscles, through: :stars, source: 'starable', source_type: 'Muscle'

    has_secure_password
    
    validates :username, :bio, :name, no_symbols: true
    validates :username, presence: true, uniqueness: true, on: :create, unless: :oauth
    validates :username, presence: true, uniqueness: true, on: :update

    validates :email, presence: true, email: true, uniqueness: true

    validates :bio, length: { in: 6..500 }

    def oauth
        !!uid
    end

    def self.find_by_username_or_email(query)
        find_by_username(query) || find_by_email(query)
    end

    def self.from_omniauth(auth)
        User.find_or_create_by(uid: auth[:uid], provider: auth[:provider]) do |u|
            u.email = auth[:info][:email]
            u.name = auth[:info][:name]
            u.password = SecureRandom.hex(32)
        end
    end
end

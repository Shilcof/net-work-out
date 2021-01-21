class User < ApplicationRecord
    has_many :workouts, :dependent => :destroy
    has_many :muscles, through: :workouts
    has_one :admin_request
    has_many :stars
    has_many :starred_workouts, through: :stars, source: :starable, source_type: 'Workout'

    has_secure_password
    
    validates :username, :bio, :name, no_symbols: true
    validates :username, presence: true, uniqueness: true, on: :create, unless: :oauth
    validates :username, presence: true, uniqueness: true, on: :update

    validates :email, presence: true, email: true, uniqueness: true

    validates :bio, length: { maximum: 500 }, on: :update

    def admin_requested
        !!admin_request
    end

    def admin_requested=(input)
        if input == "1"
            build_admin_request unless admin_request || admin
        end
    end

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

    def favourite_muscle
        muscles.group(:'muscles.id').order("count(muscles.id) DESC").limit(1)
    end
end

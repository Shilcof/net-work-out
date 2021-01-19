class User < ApplicationRecord
    has_many :workouts

    has_secure_password
    validates :username, no_symbols: true
    validates :username, presence: true, on: :create, unless: :oauth
    validates :username, presence: true, on: :update
    validates :email, presence: true, email: true

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

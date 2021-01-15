class User < ApplicationRecord
    has_many :workouts

    has_secure_password

    def self.from_omniauth(auth)
        User.find_or_create_by(uid: auth[:uid], provider: auth[:provider]) do |u|
            u.username = auth[:info][:name]
            u.password = SecureRandom.hex(32)
        end
    end
end

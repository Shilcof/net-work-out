class User < ApplicationRecord
    has_many :workouts

    has_secure_password
end

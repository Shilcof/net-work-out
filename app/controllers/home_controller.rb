class HomeController < ApplicationController
    def index
        @workout = logged_in? ? current_user.starred_workouts.sample : Workout.all.sample
    end
end
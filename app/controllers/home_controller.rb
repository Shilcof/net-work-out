class HomeController < ApplicationController
    def index
        @workout = Workout.featured
    end
end
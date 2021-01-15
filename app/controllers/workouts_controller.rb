class WorkoutsController < ApplicationController

    def index
        if params[:username]
            @user = User.find_by_username!(params[:username])
            @workouts = @user.workouts
        else
            @workouts = Workout.all
        end
    end
    
    def new
        @workout = Workout.new
        5.times {@workout.workout_exercises.build}
    end
    
    def create
        @workout = Workout.new(workout_params)
        if @workout.save
            redirect_to @workout
        else
            render :new
        end
    end
    
    def show
    end
    
    def edit
    end
    
    def update
        @workout.update(workout_params)
        if @workout.save
            redirect_to @workout
        else
            render :edit
        end
    end
    
    def destroy
        @workout.destroy
    end

    private

    def workout_params
        params.require(:workout).permit(:name, :description, :public, workout_exercises_attributes: [:exercise_id])
    end
end

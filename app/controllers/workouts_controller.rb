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
        @exercises = Exercise.all
        5.times {@workout.workout_exercises.build}
    end
    
    def create
        @workout = current_user.workouts.create
        @workout.update(workout_params)
        if @workout.save
            redirect_to @workout
        else
            @workout.destroy
            @workout= Workout.new(workout_params)
            @exercises = Exercise.all
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
        params.require(:workout).permit(:name, :information, :public, workout_exercises_attributes: [:exercise_id, :sets, :reps])
    end
end

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
        @workout.workout_exercises.build
    end
    
    def create
        @workout = current_user.workouts.build(workout_params)
        if params[:add_exercise]
            @workout.workout_exercises.build
        elsif params[:remove_exercise]
        elsif @workout.save
            @workout.update(nested_params)
            @workout.save
            return redirect_to @workout
        end
        @workout.write_workout_exercises(nested_params) if nested_params.values[0]
        @exercises = Exercise.all
        render :new
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
        params.require(:workout).permit(:name, :information, :public)
    end

    def nested_params
        params.require(:workout).permit(workout_exercises_attributes: [:exercise_id, :sets, :reps, :_destroy])
    end
end

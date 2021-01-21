class WorkoutsController < ApplicationController

    def index
        if params[:username]
            @user = User.find_by_username!(params[:username])
            if current_uri =~ /starred_workouts\z/
                @workouts = @user.starred_workouts.includes(:muscles, :user, :starred_users)
            else
                @workouts = @user.workouts.includes(:muscles, :user, :starred_users)
            end
        else
            @workouts = Workout.all.includes(:muscles, :user, :starred_users)
        end
        @muscles = Muscle.all
        @exercises = Exercise.all
        
        amount = params[:amount].first
        
        amount = 10 if amount.blank? || !amount.try(:to_i) || amount.to_i < 1

        if params[:sort] == "stars"
            @workouts = @workouts.most_starred(amount).search(params[:search]).muscles_search(params[:muscle_id]).exercises_search(params[:exercise_id])
        else
            @workouts = @workouts.latest(amount).search(params[:search]).muscles_search(params[:muscle_id]).exercises_search(params[:exercise_id])
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
            return redirect_to @workout
        end
        check_valid(@workout)
        @exercises = Exercise.all
        render :new
    end
    
    def show
        @workout_exercises = @workout.workout_exercises.includes(:exercise)
    end
    
    def edit
        @exercises = Exercise.all
    end
    
    def update
        @workout.attributes=(info_params)
        if params[:add_exercise]

            if !workout_params[:workout_exercises_attributes].blank?
                workout_params[:workout_exercises_attributes].values.each do |attributes|
                    if attributes[:id]
                        WorkoutExercise.find(attributes[:id]).update(attributes.except(:_destroy, :id))
                    else
                        @workout.workout_exercises.build(attributes.except(:_destroy)) 
                    end
                end
            end

            @workout.workout_exercises.build

        elsif params[:remove_exercise]

            if !workout_params[:workout_exercises_attributes].blank?
                workout_params[:workout_exercises_attributes].values.each do |attributes|
                    if attributes[:id]
                        WorkoutExercise.find(attributes[:id]).update(attributes.except(:_destroy, :id)) 
                        WorkoutExercise.find(attributes[:id]).destroy if attributes[:_destroy] == "1"
                    else
                        @workout.workout_exercises.build(attributes.except(:_destroy)) unless attributes[:_destroy] == "1"
                    end
                end
            end

        elsif @workout.update(workout_params)
            return redirect_to @workout
        end
        check_valid(@workout)
        @exercises = Exercise.all
        render :edit
    end
    
    def destroy
        @workout.destroy
    end

    private

    def workout_params
        params.require(:workout).permit(:name, :information, :public, workout_exercises_attributes: [:exercise_id, :sets, :reps, :_destroy, :id])
    end

    def info_params
        params.require(:workout).permit(:name, :information, :public)
    end
end

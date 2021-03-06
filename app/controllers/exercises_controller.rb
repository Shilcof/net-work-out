class ExercisesController < ApplicationController

    def index
        if params[:muscle_id]
            @muscle = Muscle.find(params[:muscle_id])
            @exercises = @muscle.exercises.includes(:starred_users)
        else
            @exercises = Exercise.all.includes(:starred_users)
        end
        @exercises = @exercises.search(params[:search]) if params[:search]
    end
    
    def new
        if params[:muscle_id]
            @muscle = Muscle.find(params[:muscle_id])
            @exercise = @muscle.exercises.build
        else
            @muscles = Muscle.all
            @exercise = Exercise.new
            @exercise.build_muscle
        end
    end
    
    def create
        @exercise = Exercise.new(exercise_params)
        byebug
        if @exercise.save
            if params[:exercise][:image]
                @exercise.image.purge
                @exercise.image.attach(params[:exercise][:image])
            end
            redirect_to @exercise
        else
            check_valid(@exercise)
            @muscles = Muscle.all
            @exercise.build_muscle unless @exercise.muscle
            render :new
        end
    end
    
    def show
        @workouts = @exercise.workouts.includes(:muscles, :user, :starred_users)
    end
    
    def edit
        @muscles = Muscle.all
    end
    
    def update
        @exercise.update(exercise_params)
        if @exercise.save
            if params[:exercise][:image]
                @exercise.image.purge
                @exercise.image.attach(params[:exercise][:image])
            end
            redirect_to @exercise
        else
            @muscles = Muscle.all
            check_valid(@exercise)
            render :edit
        end
    end
    
    def destroy
        @exercise.destroy
        redirect_to exercises_path
    end

    private

    def exercise_params
        params.require(:exercise).permit(:name, :information, :muscle_id, muscle_attributes: [:name, :information])
    end
end

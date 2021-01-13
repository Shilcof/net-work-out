class ExercisesController < ApplicationController
    before_action :set_exercise, only: [:show, :edit, :update, :destroy]

    def index
        if params[:muscle_id]
            @muscle = Muscle.find(params[:muscle_id])
            @exercises = @muscle.exercises
        else
            @exercises = Exercise.all
        end
    end
    
    def new
        if params[:muscle_id]
            @muscle = Muscle.find(params[:muscle_id])
            @exercise = @muscle.exercises.build
        else
            @exercise = Exercise.new
        end
    end
    
    def create
        @exercise = Exercise.new(exercise_params)
        if @exercise.save
            redirect_to @exercise
        else
            render :new
        end
    end
    
    def show
    end
    
    def edit
    end
    
    def update
        @exercise.update(exercise_params)
        if @exercise.save
            redirect_to @exercise
        else
            render :edit
        end
    end
    
    def destroy
        @exercise.destroy
    end

    private

    def exercise_params
        params.require(:exercise).permit(:name, :information)
    end

    def set_exercise
        @exercise = Exercise.find(params[:id])
    end
end

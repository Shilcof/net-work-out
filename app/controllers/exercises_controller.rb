class ExercisesController < ApplicationController

    def index
        if params[:muscle_id]
            @muscle = Muscle.find(params[:muscle_id])
            @exercises = @muscle.exercises
        else
            @exercises = Exercise.all
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
        params.require(:exercise).permit(:name, :information, :muscle_id, muscle_attributes: [:name, :information])
    end
end

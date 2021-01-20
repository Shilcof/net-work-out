class MusclesController < ApplicationController

    def index
        @muscles = Muscle.all
        @muscles = @muscles.search(params[:search]) if params[:search]
    end
    
    def new
        @muscle = Muscle.new
    end
    
    def create
        @muscle = Muscle.new(muscle_params)
        if @muscle.save
            redirect_to @muscle
        else
            render :new
        end
    end
    
    def show
        @workouts = @muscle.workouts.includes(:muscles, :user)
    end
    
    def edit
    end
    
    def update
        @muscle.update(muscle_params)
        if @muscle.save
            redirect_to @muscle
        else
            render :edit
        end
    end
    
    def destroy
        @muscle.destroy
        redirect_to muscles_path
    end

    private

    def muscle_params
        params.require(:muscle).permit(:name, :information)
    end
end

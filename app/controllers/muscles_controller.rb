class MusclesController < ApplicationController
    before_action :set_muscle, only: [:show, :edit, :update, :destroy]

    def index
        @muscles = Muscle.all
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
    end

    private

    def muscle_params
        params.require(:muscle).permit(:name, :information)
    end

    def set_muscle
        @muscle = Muscle.find(params[:id])
    end
end

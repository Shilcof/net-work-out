class MusclesController < ApplicationController
    before_action :set_muscle, only: [:show, :edit, :update, :destroy]

    def index
        
    end
    
    def new
        
    end
    
    def create
        
    end
    
    def show
        
    end
    
    def edit
        
    end
    
    def update
        
    end
    
    def destroy
        
    end

    private

    def muscle_params
        params.require(:muscle).permit(:name, :information)
    end

    def set_muscle
        @muscle = Muscle.find(params[:id])
    end
end

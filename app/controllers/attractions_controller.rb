class AttractionsController < ApplicationController
    before_action :set_attraction, only: [:show, :edit, :update, :destroy]
    def new
        @attraction = Attraction.new
    end

    def create 
        @attraction = Attraction.new(attraction_params)
        if @attraction.save
            redirect_to attraction_path(@attraction)
        else 
            redirect_to attractions_path
        end
    end

    def show
        @ride = Ride.new
    end

    def index
        @attractions = Attraction.all
    end
    
    def edit 
    end
    
    def update 
        @attraction.update(attraction_params)
    end
    
    private 

    def attraction_params 
        params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
    end

    def set_attraction
      @attraction = Attraction.find(params[:id])
    end
    
end

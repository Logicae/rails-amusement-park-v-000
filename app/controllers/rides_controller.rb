class RidesController < ApplicationController

    def new 
        @ride = Ride.new( user_id: params[:user_id], attraction_id: params[:attraction_id])
        @ride.save
        flash.alert = @ride.take_ride
        flash.notice = @ride.thanks
        redirect_to user_path(@ride.user)
    end 
end

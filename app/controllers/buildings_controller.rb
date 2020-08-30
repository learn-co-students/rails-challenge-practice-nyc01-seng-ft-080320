class BuildingsController < ApplicationController
    before_action :find_building, only: [:show, :edit, :update, :destroy]
    
    def index
        @buildings = Building.all
    end

    def show
    end

    def new
    end

    def create
    end

    def edit
    end

    def update
       if @building.update(building_params)
            redirect_to building_path(@building)
       else
            flash[:errors] = @building.errors.full_messages
            redirect_to edit_building_path(@building)
       end
    end

    def destroy
    end

    private

    def building_params
        params.require(:building).permit(:name, :country, :address, :rent_per_floor, :number_of_floors)
    end

    def find_building
        @building = Building.find(params[:id])
    end

end
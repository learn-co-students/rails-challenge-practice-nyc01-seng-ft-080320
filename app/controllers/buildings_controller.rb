class BuildingsController < ApplicationController
    before_action :find_building, only: [:show, :edit, :update]
    def show

    end

    def index
        @buildings = Building.all
    end

    def edit

    end

    def update

    end

    private

    def find_building
        @building = Building.find(params[:id])
    end
end
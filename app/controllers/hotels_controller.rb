class HotelsController < ApplicationController
    def index
        hotels = Hotel.all
        render json: hotels, status: 200
      end
end

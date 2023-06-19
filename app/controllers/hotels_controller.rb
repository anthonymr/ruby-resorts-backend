class HotelsController < ApplicationController
  def index
    render json: Hotel.all, status: 200
  end
end

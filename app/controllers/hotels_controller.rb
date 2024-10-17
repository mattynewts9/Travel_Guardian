class HotelsController < ApplicationController
  before_action :authenticate_user!
  def index
    if params[:search].present?
      @hotels = Hotel.search_by_name_and_address(params[:search])
    else
      @hotels = Hotel.all
    end
    # The `geocoded` scope filters only flats with coordinates
    @markers = @hotels.geocoded.map do |hotel|
      {
        lat: hotel.latitude,
        lng: hotel.longitude
      }
    end
  end
  # def show

  # end
end

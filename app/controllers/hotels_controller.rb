class HotelsController < ApplicationController
  before_action :authenticate_user!
  def index
    @hotels = Hotel.all
    # The `geocoded` scope filters only flats with coordinates
    @markers = @hotels.geocoded.map do |hotel|
      {
        lat: hotel.latitude,
        lng: hotel.longitude
      }
    end
  end
end

class HotelsController < ApplicationController
  before_action :authenticate_user!
  def index
    @hotels = Hotels.all
    # The `geocoded` scope filters only flats with coordinates
    @markers = @hotels.geocoded.map do |hotel|
      {
        lat: flat.latitude,
        lng: flat.longitude
      }
    end
  end
end

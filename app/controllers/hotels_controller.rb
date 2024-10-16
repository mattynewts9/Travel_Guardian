class HotelsController < ApplicationController
  before_action :authenticate_user!
  def index
    @hotels = Hotel.all
    @hotels = @hotels.where(title: params[:search]) if params[:search].present?
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

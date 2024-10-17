class HotelsController < ApplicationController
  before_action :authenticate_user!
  def index
    @hotels = Hotel.all
    if params[:search].present?
      sql_subquery = <<~SQL
        hotels.name @@ :search
      SQL
      @hotels = @hotels.where(sql_subquery, search: params[:search])
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

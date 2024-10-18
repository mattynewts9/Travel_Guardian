class HotelsController < ApplicationController
  before_action :authenticate_user!

  def index
    if params[:search].present?
      @hotels = Hotel.search_by_name_and_address(params[:search])
    else
      @hotels = Hotel.all
    end

    @markers = @hotels.geocoded.map do |hotel|
      {
        lat: hotel.latitude,
        lng: hotel.longitude
      }
    end
  end

  def show
    @hotel = Hotel.find(params[:id])
    @reports = @hotel.reports.includes(:user) # Load reviews for the hotel
    @report = Report.new # Initialize a new review for the form
  end
end

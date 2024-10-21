class HotelsController < ApplicationController
  before_action :authenticate_user!

  def index
    if params[:search].present?
      @hotels = Hotel.search_by_name_and_address(params[:search])
      @crimes = Crime.near(params[:search], 10)
    else
      @hotels = Hotel.all
      @crimes = nil
    end

    @hotel_markers = @hotels.geocoded.map do |hotel|
      {
        lat: hotel.latitude,
        lng: hotel.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { hotel: hotel }),
        marker_html: render_to_string(partial: "hotel_marker"),
        marker_color: 'blue'
      }
    end

    if @crimes
      @crime_markers = @crimes.geocoded.map do |crime|
        {
          lat: crime.latitude,
          lng: crime.longitude,
          marker_html: render_to_string(partial: "crime_marker"),
          info_window_html: render_to_string(partial: "crime_info_window", locals: { crime: crime }),
          marker_color: 'red'
        }
      end
    end

    @categories = Crime.where.not(category: nil).distinct.pluck(:category)
    @dates = Crime.where.not(date: nil).distinct.pluck(:date)
  end

  def show
    @hotel = Hotel.find(params[:id])
    @reports = @hotel.reports.includes(:user) # Load reviews for the hotel
    @report = Report.new # Initialize a new review for the form
  end
end

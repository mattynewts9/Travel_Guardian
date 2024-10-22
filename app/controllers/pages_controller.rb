class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  def reportform
    @hotel = Hotel.find(params[:hotel_id])
    @report = Report.new
  end
end

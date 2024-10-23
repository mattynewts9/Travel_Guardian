class ReportsController < ApplicationController
  def new
    @hotel = Hotel.find(params[:hotel_id])
    @report = Report.new
  end


  def create
    @hotel = Hotel.find(params[:hotel_id]) # Find the hotel by ID
    @report = Report.new(report_params)
    @report.hotel = @hotel
    @report.user = current_user
   
    if @report.save # Save the report
      redirect_to @hotel, notice: 'Report was successfully created.' # Redirect with a success message
    else
      render :new, status: :unprocessable_entity # Render the new form again with errors
    end
  end

  private

  def report_params
    params.require(:report).permit(:comment, :safety_rating) # Permit only the required report attributes
  end
end

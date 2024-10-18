class ReportsController < ApplicationController
  def create
    @hotel = Hotel.find(params[:hotel_id]) # Find the hotel by ID
    @report = @hotel.reports.new(report_params) # Create a new report associated with the hotel

    if @report.save # Save the report
      redirect_to @hotel, notice: 'Report was successfully created.' # Redirect with a success message
    else
      render :new, status: :unprocessable_entity # Render the new form again with errors
    end
  end

  private

  def report_params
    params.require(:report).permit(:content, :rating) # Permit only the required report attributes
  end
end

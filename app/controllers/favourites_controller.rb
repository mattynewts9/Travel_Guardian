class FavouritesController < ApplicationController
  def index
    @favourites = Favourite.where(user: current_user)
  end

  def create
    @favourite = Favourite.new
    @hotel = Hotel.find(params[:hotel_id])
    @user = current_user

    @favourite.user = @user
    @favourite.hotel = @hotel
    
    if @favourite.save
      redirect_to hotel_path(@hotel), notice: 'favourite was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @favourite = Favourite.find(params[:id])
    @favourite.destroy
    redirect_to favourites_path, status: :see_other
  end

  private

  def set_hotel
    @hotel = Hotel.find(params[:hotel_id])
  end


end

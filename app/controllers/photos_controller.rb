class PhotosController < ApplicationController
before_action :authenticate_user!
#find place, create photo tied to that place
  def create
    @place = Place.find(params[:place_id])
    @place.photos.create(photo_params)
    redirect_to place_path(@place)
  end
  private
  #params required to create a photo
  def photo_params
    params.require(:photo).permit(:caption, :picture)
  end
end


class PlacesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @places = Place.paginate(:page => params[:page], per_page: 10)
  end

  # create an empty place and send user to views/places/new
  def new
    @place = Place.new
  end
 #create a new place with place params
  def create
    @place = current_user.places.create(place_params)

      if @place.valid?
        redirect_to root_path
      else
        render :new, status: :unprocessable_entity
      end
    
  end
#views/places/show grab place for show view
  def show
    @place = Place.find(params[:id])
    @comment = Comment.new
    @photo = Photo.new
  end
#views/places/edit send user to edit view if the user created that place
  def edit
    @place = Place.find(params[:id])

      if @place.user != current_user
        return render plain: 'Not Allowed', status: :forbidden
      end

  end
# if user trys to update a place they didnt create they are denied. 
#if they are the user that created, update att's of place then redirect to root
  def update
    @place = Place.find(params[:id])

      if @place.user != current_user
        return render plain: 'Not Allowed', status: :forbidden
      end

      if @place.valid?
        redirect_to root_path
      else
        render :edit, status: :unprocessable_entity
      end

  end
#find place and destroy if user created that place
  def destroy
    @place = Place.find(params[:id])

      if @place.user != current_user
        return render plain: 'Not Allowed', status: :forbidden
      end

    @place.destroy
    redirect_to root_path
  end

  private

  def place_params
    params.require(:place).permit(:name, :description, :address)
  end

end

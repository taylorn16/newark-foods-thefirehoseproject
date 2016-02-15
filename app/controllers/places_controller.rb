class PlacesController < ApplicationController
  before_action :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy]

  def index
    @places = Place.paginate(:page => params[:page], :per_page => 2)
  end

  def new
  	@place = Place.new
  end

  def create
    @place = current_user.places.create(place_params)

    # Check if place is valid
    if @place.valid?
      return redirect_to place_path(@place)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @place = Place.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @place = Place.find(params[:id])

    if @place.user != current_user
      flash[:alert] = "You do not have permission to edit places that aren't yours. Not cool."
      return redirect_to place_path(@place)
    end
  end

  def update
    @place = Place.find(params[:id])

    if @place.user != current_user
      return render(:text => "Not Allowed.", :status => :forbidden)
    end

    @place.update_attributes(place_params)

    if @place.valid?
      return redirect_to place_path(@place)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @place = Place.find(params[:id])

    if @place.user != current_user
      return render(:text => "Not Allowed.", :status => :forbidden)
    end

    @place.destroy
    flash[:notice] = "You have successfully deleted the place called #{@place.name}."
    return redirect_to root_path
  end

  private

  def place_params
  	params.require(:place).permit(:name, :description, :address)
  end
end

class RequestsController < ApplicationController
  before_action :set_user, only: [ :new, :create, :edit, :update, :destroy ]
  before_action :set_request, only: [ :show, :edit, :update, :destroy ]

  def index
    policy_scope(Request)
    @requests = Request.all
  end

  def show
    authorize @request
  end

  def new
    @request = Request.new
    authorize @request
    @markers = [
      {
        lat: current_user.latitude,
        lng: current_user.longitude#,
        # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
    }]
  end

  def create
    @request = Request.new(request_params)
    @request.user = @user
    pickup_results = Geocoder.search(@request.pickup_location)
    pickup_lat = pickup_results.first.geometry["location"]["lat"]
    pickup_long = pickup_results.first.geometry["location"]["lng"]
    dropoff_results = Geocoder.search(@request.dropoff_location)
    dropoff_lat = dropoff_results.first.geometry["location"]["lat"]
    dropoff_long = dropoff_results.first.geometry["location"]["lng"]
    @request.distance = (distance [pickup_lat, pickup_long], [dropoff_lat, dropoff_long])*0.000621371
    @request.status = "Requested"
    if @request.save
      flash[:create] = "Transportation request has been created!"
      redirect_to request_path(@request)
    else
      flash[:nocreate] = "Transportation request has not been created!"
      render :new
    end
    authorize @request
  end

  def edit
    authorize @request
  end

  def update
    authorize @request
    if @request.update(request_params)
      redirect_to request_path(@request)
      flash[:create] = "#{@user.name} request has been updated!"
    else
      render :show
    end
  end

  def destroy
    @request.destroy
    authorize @request
    if @request.destroy
      redirect_to requests_path
      flash[:create] = "Request has been removed!"
    else
      render :show
    end
  end

  private

  def set_request
    @request = Request.find(params[:id])
  end

  def set_user
    @user = current_user
  end

  def request_params
    params.require(:request).permit(:pickup_location, :dropoff_location, :datetime, dog_ids: [])
  end

  def distance loc1, loc2
    rad_per_deg = Math::PI/180  # PI / 180
    rkm = 6371                  # Earth radius in kilometers
    rm = rkm * 1000             # Radius in meters

    dlat_rad = (loc2[0]-loc1[0]) * rad_per_deg  # Delta, converted to rad
    dlon_rad = (loc2[1]-loc1[1]) * rad_per_deg

    lat1_rad, lon1_rad = loc1.map {|i| i * rad_per_deg }
    lat2_rad, lon2_rad = loc2.map {|i| i * rad_per_deg }

    a = Math.sin(dlat_rad/2)**2 + Math.cos(lat1_rad) * Math.cos(lat2_rad) * Math.sin(dlon_rad/2)**2
    c = 2 * Math::atan2(Math::sqrt(a), Math::sqrt(1-a))

    rm * c # Delta in meters
  end

end

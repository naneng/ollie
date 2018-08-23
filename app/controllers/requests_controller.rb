class RequestsController < ApplicationController
  before_action :set_user, only: [ :new, :create, :edit, :destroy ]
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


  def destroy
    authorize @request
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
end

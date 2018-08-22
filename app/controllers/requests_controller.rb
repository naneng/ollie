class RequestsController < ApplicationController
  before_action :set_user

  def index

  end

  def new
    @request = Request.new
    authorize @request
  end

  def create
    @request = Request.new(request_params)
    @request.user = @user
    if @request.save
      redirect_to root_path
      flash[:create] = "Transportation request has been created!"
    else
      flash[:nocreate] = "Transportation request has not been created!"
      render :new
    end
    authorize @request
  end

  def edit
  end

  def show
  end

  def destroy
  end

  private

  def set_user
    @user = current_user
  end

  def request_params
    params.require(:request).permit(:pickup_location, :dropoff_location, :datetime, dog_ids: [])
  end
end

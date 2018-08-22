class RequestsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :set_user

  def index
    @requests = policy_scope(Request)

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

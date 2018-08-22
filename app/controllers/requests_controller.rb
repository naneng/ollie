class RequestsController < ApplicationController
  before_action :set_user, only: [ :new, :create, :edit, :destroy ]
  before_action :set_request, only: [ :show, :edit, :update, :destroy ]


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
    authorize @request
  end

  def show
    authorize @request
  end

  def destroy
    authorize @request
  end

  private

  def set_request
    # @dog = Dog.find(params[:dog_id])
    @request = Request.find(params[:id])
  end

  def set_user
    @user = current_user
  end

  def request_params
    params.require(:request).permit(:pickup_location, :dropoff_location, :datetime, dog_ids: [])
  end
end

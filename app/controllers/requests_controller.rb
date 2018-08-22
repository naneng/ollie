class RequestsController < ApplicationController

  before_action :set_user, only: [ :new, :create, :edit, :destroy ]
  before_action :set_request

  def index
    @requests = policy_scope(Request)

  end

  def new
    @request = Request.new
    authorize @request
  end

  def create
    @dog = Dog.find(params[:dog_id])
    @user = current_user
    @request = Request.new(request)
    @request.dog = @dog
    if @request.valid?
      @request.save
      redirect_to dog_path(@dog)
      flash[:confirm] = "Transport Request has been confirmed for #{@dog}"
    else
      flash[:nonconfirm] = "Transport Request has not been booked"
      @request = Request.new
      redirect_to new_request_path(@request)
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
    @request = Request.find(params[:id])
  end

  def set_user
    @user = current_user
  end
end

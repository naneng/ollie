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
end

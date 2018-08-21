class RequestsController < ApplicationController
  before_action :set_user

  def index

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

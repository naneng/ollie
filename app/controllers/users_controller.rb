class UsersController < ApplicationController
  # before_action :set_user, only: [ :show, :edit, :update, :destroy ]

  def index

    if params[:query].present?
      @users = User.global_search(params[:query])
    else
      @users = User.all
    end
  end


  def show
    @user = User.includes(:dogs).find(params[:id])
  end

end

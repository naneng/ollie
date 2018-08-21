class UsersController < ApplicationController
  # before_action :set_user, only: [ :show, :edit, :update, :destroy ]



  def show
    @user = User.includes(:dogs).find(params[:id])
  end

  # def edit
  # end

  # def update
  # end

  # def destroy
  # end

  private
  def user_params
    params.require(:user).permit(:name, :location, :website, :email, :encrypted_password, :organization, :nonprofit_status, :photo, :photo_cache)
  end

  def set_user
    @user = User.find(params[:id])
  end
end

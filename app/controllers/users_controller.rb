class UsersController < ApplicationController
  before_action :set_user, only: [ :show, :edit, :update, :destroy ]
  # before_action :set_user, only: [ :show, :edit, :update, :destroy ]
  skip_before_action :authenticate_user!

  def index
    if params[:query].present?
      @users = policy_scope(User).global_search(params[:query])
    else
      @users = policy_scope(User)
    end
  end


  def show
    @user = User.includes(:dogs).find(params[:id])
    authorize @user
  end

   def edit
    authorize @user
  end

  private

  def set_user
    @user = current_user
  end

end

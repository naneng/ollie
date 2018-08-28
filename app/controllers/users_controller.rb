class UsersController < ApplicationController
  before_action :set_user, only: [ :show, :edit, :update, :destroy, :follow, :unfollow ]
  # before_action :set_user, only: [ :show, :edit, :update, :destroy ]
  skip_before_action :authenticate_user!

  def index
    if params[:query].present?
      @users = policy_scope(User).global_search(params[:query])
    elsif params[:partner].present?
      @users = policy_scope(User).where(organization: true)
    elsif params[:member].present?
      @users = policy_scope(User).where(organization: false)
    else
      @users = policy_scope(User)
    end
  end

  def show
    authorize @user
  end

  def edit
    authorize @user
  end

  def follow
    authorize @user
    if current_user.follow(@user.id)
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
      end
    end
  end

  def unfollow
    authorize @user
    if current_user.unfollow(@user.id)
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js { render action: :follow }
      end
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end

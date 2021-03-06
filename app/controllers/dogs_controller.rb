class DogsController < ApplicationController

  before_action :set_dog, only: [ :show, :edit, :update, :destroy ]

  def index
    @dogs = policy_scope(Dog)
  end

  def show
    authorize @dog
  end

  def new
    @dog = Dog.new
    authorize @dog
  end

  def create
    @dog = Dog.new(dog_params)
    if !@dog.photo
      @dog.photo = "Vectorshiba-logo-1.jpg"
    end
    authorize @dog
    @dog.user = current_user
    if @dog.save
      redirect_to user_path(current_user)
      flash[:create] = "#{@dog.name} has been registered!"
    else
      render :new
    end
  end

  def edit
    authorize @dog
  end

  def update
    @dog.update(dog_params)
    authorize @dog
    redirect_to dog_path(@dog)
  end

  def destroy
    authorize @dog
    if @dog.destroy
      redirect_to user_path(current_user)
      flash[:create] = "#{@dog.name} has been removed from the shelter!"
    else
      render :index
    end
  end

  private

  def dog_params
    params.require(:dog).permit(:name, :breed, :size, :personality, :age, :gender, :photo, :photo_cache)
  end

  def set_dog
    @dog = Dog.find(params[:id])
  end

end

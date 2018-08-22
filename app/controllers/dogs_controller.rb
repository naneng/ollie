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
    if @dog.save
      redirect_to user_path(current_user)
      flash[:create] = "#{dog.name} has been created!"
    else
      render :new
    end
  end

  def edit
    authorize @dog
  end

  def update
    authorize @dog
  end

  def destroy
    authorize @dog
  end

  private

  def dog_params
    params.require(:dog).permit(:name, :breed, :size, :personality, :age, :gender, :photo, :photo_cache)
  end

  def set_dog
    @dog = Dog.find(params[:id])
  end

end

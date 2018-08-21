class DogsController < ApplicationController

  authorize @dog

  before_action :set_dog, only: [ :show, :edit, :update, :destroy ]

  def show
    @dogs = Dog.all
  end

  def new
    @dog = Dog.new
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
  end

  def update
  end

  def destroy
  end

  private

  def dog_params
    params.require(:dog).permit(:name, :breed, :size, :personality, :age, :gender, :photo, :photo_cache)
  end

  def set_dog
    @dog = Dog.find(params[:id])
  end

end

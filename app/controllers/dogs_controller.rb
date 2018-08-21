class DogsController < ApplicationController
  def show
    @dogs = Dog.all
  end

  def new
    @dog = Dog.new
  end

  def create
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
    @user = User.find(params[:user_id])
    @dog = Dog.find(params[:id])

  end

end

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
    authorize @dog
    @dog.user = current_user
    if @dog.save
      redirect_to user_path(current_user)
      flash[:create] = "#{@dog.name} has been created!"
    else
      render :new
    end
  end

  def edit
    # @dog.user = current_user
    authorize @dog
  end

  def update
    # @dog.user = current_user
    @dog.update(dog_params)
    authorize @dog
    redirect_to dog_path(@dog)
  end

  def destroy
    puts "<<<<<<<<<<<<<<destroy>>>>>>>>>>>"
    authorize @dog
    if @dog.destroy
      redirect_to user_path(current_user)
      flash[:create] = "#{@dog.name} has been removed!"
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

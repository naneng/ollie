class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @dogs = Dog.all.first(6)

  end
end

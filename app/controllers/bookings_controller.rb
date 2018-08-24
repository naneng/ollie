class BookingsController < ApplicationController

  def create
    @booking = Booking.new(user: current_user, request: Request.find(params[:request_id]))
    authorize @booking
    if @booking.save
      @booking.request.status = "Booked"
      @booking.request.save
      redirect_to user_path(current_user)
      flash[:booking_create] = "Transportation has been booked!"
    else
      flash[:booking_no_create] = "Transportation has not been booked"
      render :new
    end
  end

end

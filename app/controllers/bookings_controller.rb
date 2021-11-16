class BookingsController < ApplicationController
def new
  @toilet = Toilet.find(params[:toilet_id])
  @booking = Booking.new
end

def create
  @toilet = Toilet.find(params[:toilet_id])
  @booking = Booking.new(booking_params)
  @booking.toilet = @toilet
  @booking.user_id = current_user.id

  if @booking.save
    redirect_to toilet_path(@toilet)
  else
    render :new
  end
end

private

def booking_params
  params.require(:booking).permit(:message, :date_start, :date_end)
end
end

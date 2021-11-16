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
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy

    redirect_to dashboard_path(current_user)
  end

  private

  def booking_params
    params.require(:booking).permit(:message, :date_start, :date_end)
  end
end

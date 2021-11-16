class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @booking = Booking.find(params[:booking_id])
    @review = Review.new(review_params)
    @review.Booking = @booking
    @review.user_id = current_user.id

    if @review.save
      redirect_to toilet_path(@toilet)
    else
      render :new
    end
  end
end

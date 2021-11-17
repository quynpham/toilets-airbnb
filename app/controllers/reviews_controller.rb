class ReviewsController < ApplicationController
  def index
    @review = Review.all
  end

  def new
    @review = Review.new
  end

  def show
    @review = Review.find(params[:id])
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

private

def review_params
  params.require(:review).permit(:rating, :comment)
end

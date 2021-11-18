class ToiletsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home,:index]

  def index
    if params[:query].present?
      @toilets = Toilet.where("location ILIKE ?", "%#{params[:query]}%")
    else
      @toilets = Toilet.all
    end

    @markers = @toilets.geocoded.map do |toilet|
      {
        lat: toilet.latitude,
        lng: toilet.longitude,
        info_window: render_to_string(partial: "info_window", locals: { toilet: toilet }),
        image_url: helpers.asset_url('poop.gif')
      }
    end
  end




  def new
    @toilet = Toilet.new
  end

  def show
    @toilet = Toilet.find(params[:id])
    @bookings = @toilet.bookings
  end

  def create
    @toilet = Toilet.new(toilet_params)
    @toilet.user_id = current_user.id
    if @toilet.save
      redirect_to toilet_path(@toilet)
    else
      render :new
    end
  end

  private

  def toilet_params
    params.require(:toilet).permit(:name, :description, :location, :price, photos: [])
  end
end

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
  end

  def dashboard
    @user = current_user
    @bookings = @user.bookings

    @toilets = Toilet.where(user: @user)
    @bookings_of_your_toilets = []
    @toilets.each do |toilet|
      toilet.bookings.each do |booking|
        @bookings_of_your_toilets << booking
      end
    end
  end
end

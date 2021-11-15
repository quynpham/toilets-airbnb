class ToiletsController < ApplicationController
def index
  @toilets = Toilet.all
end

def new
  @toilet = Toilet.new
end

def show
  @toilet = Toilet.find(params[:id])
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
  params.require(:toilet).permit(:name, :description, :location, :price)
end
end

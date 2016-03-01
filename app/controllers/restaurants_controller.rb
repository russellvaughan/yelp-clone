class RestaurantsController < ApplicationController
  def index
  @restaurants = Restaurant.all
  end
  
  def show
  @restaurant = Restaurant.find(params[:id])
  end

  def new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)

    @restaurant.save
    redirect_to action:'index'
  end

  def edit 
  @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    if @restaurant.update(restaurant_params) 
     redirect_to @restaurant
   else 
    render "edit"
    end
  end

  private
  def restaurant_params
    params.require(:restaurant).permit(:name, :rating)
  end

end

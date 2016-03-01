class RestaurantsController < ApplicationController
  def index
  end
  
  def show
    @restaurants = Restaurant.all
  end

  def new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)

    @restaurant.save
    redirect_to @restaurant
  end

  private
  def restaurant_params
    params.require(:restaurant).permit(:name, :rating)
  end
 
end

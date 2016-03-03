class RestaurantsController < ApplicationController

  before_action :authenticate_user!, :expect => [:index, :show,]

  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurants_path
    else
      render 'new'
    end
  end

  def restaurant_params
    params.require(:restaurant).permit(:name)
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    if user_owns_restaurant?
    @restaurant.update(restaurant_params)
    else 
    flash[:notice]="Cannot edit a restaurant you didn't create"
    end
    redirect_to '/restaurants'
  end

  def user_owns_restaurant?
   @restaurant.user == current_user 
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    flash[:notice] = 'Restaurant deleted successfully'
    redirect_to '/restaurants'
  end

end

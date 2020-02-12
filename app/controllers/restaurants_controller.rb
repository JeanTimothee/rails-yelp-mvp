class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @average = average_rating(@restaurant)
    raise
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.save

    redirect_to restaurant_path(@restaurant)
  end

  private

  def average_rating(restaurant)
    if restaurant.reviews.length != 0
      sum = 0
      restaurant.reviews.each do |review|
        sum += review.rating
      end
      return sum / restaurant.reviews.length
    else return "No review yet"
    end
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :category, :phone_number)
  end
end

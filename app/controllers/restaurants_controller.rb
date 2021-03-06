class RestaurantsController < ApplicationController

	def index
		@restaurants = Restaurant.all
	end

	def new
		@restaurant = Restaurant.new
	end

	def create
		@restaurant = Restaurant.new(params[:restaurant].permit(:name, :description))
		if @restaurant.save
			redirect_to restaurants_path
		else
			render 'new'
		end
	end


	def edit
		@restaurant = Restaurant.find(params[:id])
	end

	def update
		@restaurant = Restaurant.update(params[:id], params[:restaurant].permit(:name))
		redirect_to restaurants_path
	end

	def destroy
		@restaurant = Restaurant.find(params[:id])
		@restaurant.delete
		flash[:notice] = "Restaurant deleted successfully"
		redirect_to restaurants_path
	end

	def show
		@restaurant = Restaurant.find(params[:id])
		
	end

end

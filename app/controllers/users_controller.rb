class UsersController < ApplicationController
	def index
		@user = User.all
	end

	def show
		@user = User.find(params[:id])
		@meals = Meal.where(user_id:params[:id])
	end


	# private

	# 	def recipe_params
	# 		params.require(:recipe).permit(:name, :summary, :description, :picture)
	# 	end
end

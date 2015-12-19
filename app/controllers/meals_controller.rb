class MealsController < ApplicationController
	def show
		@meals = Meal.find(params[:id])
		@menuItem = MenuItem.where(meal_id:params[:id])
	end

	def new
		@meal = Meal.new
		session[:return_to] ||= request.referer
	end

	def edit
		@meal = Meal.find(params[:id])
		session[:return_to] ||= request.referer
	end

	def destroy
		@meal = Meal.find(params[:id])
		@meal.destroy

		redirect_to request.referrer
	end

	def update
		@meal = Meal.find(params[:id]) 
		if @meal.update(meal_params)
			redirect_to session.delete(:return_to)
		else
			render 'edit'
		end
	end

	def create
		# binding.pry
		# pull in the data/params from the submitted form
		@meal = Meal.new(meal_params)
		@meal.user = User.find(1)
		if @meal.save
			redirect_to session.delete(:return_to)
		else
			render "new"
		end
	end

	private
		def meal_params
			# allows submitted params to be mass assigned
			params.require(:meal).permit(:name)
		end
end

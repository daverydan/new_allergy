class IngredientsController < ApplicationController
	def index
		@ingredients = Ingredient.all
		@user = User.find(1)
	end

	def new
		@ingredient = Ingredient.new
		session[:return_to] ||= request.referer
	end

	def edit
		@ingredient = Ingredient.find(params[:id])
		session[:return_to] ||= request.referer
	end

	def show
		@ingredient = Ingredient.find(params[:id])
		@user = User.find(1)
	end

	def destroy
		@ingredient = Ingredient.find(params[:id])
		@ingredient.destroy

		redirect_to request.referrer
	end

	def update
		@ingredient = Ingredient.find(params[:id]) 
		if @ingredient.update(ingredient_params)
			redirect_to session.delete(:return_to)
		else
			render 'edit'
		end
	end

	def create
		# binding.pry
		# pull in the data/params from the submitted form
		@ingredient = Ingredient.new(ingredient_params)
		@ingredient.menu_item = MenuItem.find(1)
		if @ingredient.save
			redirect_to session.delete(:return_to)
		else
			render "new"
		end
	end

	private
		def ingredient_params
			# allows submitted params to be mass assigned
			params.require(:ingredient).permit(:name)
		end
end

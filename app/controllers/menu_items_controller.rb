class MenuItemsController < ApplicationController
	def index
		@menu_item = MenuItem.all
		@user = User.find(1)
	end

	def new
		@menu_item = MenuItem.new
		session[:return_to] ||= request.referer
	end

	def edit
		@menu_item = MenuItem.find(params[:id])
		session[:return_to] ||= request.referer
	end

	def show
		@menu_item = MenuItem.find(params[:id])
		@user = User.find(1)
		@ingredient = Ingredient.where(menu_item_id:params[:id])
	end

	def destroy
		@menu_item = MenuItem.find(params[:id])
		@menu_item.destroy

		redirect_to request.referrer
	end

	def update
		@menu_item = MenuItem.find(params[:id]) 
		if @menu_item.update(menu_item_params)
			redirect_to session.delete(:return_to)
		else
			render 'edit'
		end
	end

	def create
		# binding.pry
		# pull in the data/params from the submitted form
		@menu_item = MenuItem.new(menu_item_params)
		@menu_item.meal = Meal.find(1)
		if @menu_item.save
			redirect_to session.delete(:return_to)
		else
			render "new"
		end
	end

	private
		def menu_item_params
			# allows submitted params to be mass assigned
			params.require(:menu_item).permit(:name)
		end
end

class IngredientsController < ApplicationController
	
	
	def new 
		@ingredient = Ingredient.new
	end
	
	
	def create
		@ingredient= Ingredient.new(ingredient_params)
		if @ingredient.save
				flash[:success] = "Well done, You've got ingredients"
				session[:ingredient_id]=@ingredient.id
				redirect_to :back
			
		else
			render 'new'
			
		end
	end
	
	def show
			@ingredient = Ingredient.find(params[:id])
	end
	
	
	private
	
	def ingredient_params
		params.require(:ingredient).permit(:name)
	end
	
	
end
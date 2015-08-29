class StylesController < ApplicationController
	before_action :require_user, except: [:show]
	
	def new 
		@style = Style.new
	end
	
	
	def create
		@style = Style.new(style_params)
		if @style.save
				flash[:success] = "Well done, You've got style"
				session[:style_id]=@style.id
				redirect_to :back
			
		else
			render 'new'
			
		end
	end
	
	def show
		@style = Style.find(params[:id])
		@recipes = @style.recipes.paginate(page: params[:page], per_page: 2)
	end
	
	
	private
	
	def style_params
		params.require(:style).permit(:name)
	end
	
	
end
class StylesController < ApplicationController
	
	
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
	end
	
	
	private
	
	def style_params
		params.require(:style).permit(:name)
	end
	
	
end
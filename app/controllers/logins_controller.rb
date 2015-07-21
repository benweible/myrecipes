class LoginsController < ApplicationController
	
	def new
		
	end
	
	
	def create
		chef = Chef.find_by(email: params[:email])
		if chef && chef.authenticate(params[:password])
			flash[:success] = "You are logged in"
			redirect_to 'recipes_path'
			session[:chef_id] = chef.id
			
		else
			flash.now[:danger] = "Your email or password is wrong"
			render 'new'
			
		end
			
	
	end
	
	def destroy
		session[:chef_id] = nil
		flash[:success] = "You are logged out"
		redirect_to 'recipes_path'
		
	end
	
	

end
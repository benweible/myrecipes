
Rails.application.routes.draw do
  
root 'pages#home'
get '/home', to: 'pages#home'


#get '/recipes', to: 'recipes#index'
#get '/recipes/new', to: 'recipes#new', as: 'new_recipe'
#post '/recipes', to: 'recipes#create'
#get '/recipes/edit', to: 'recipes#edit', as: 'edit_recipe'
#patch 'recipes/:id', to: 'recipe#update'
#get 'recipes/:id', to: 'recipe#show'
#delete 'recipes/:id', to: 'recipe#destroy'

resources :recipes do
	member do
		post 'like'
	end
end

resources :chefs, except: [:new, :destroy]
	get '/register', to: 'chefs#new'
	
resources :styles, only: [:new, :create, :show]
resources :ingredients, only: [:new, :create, :show]

get '/login', to: 'logins#new'
post '/login', to: 'logins#create'
get '/logout', to: 'logins#destroy'



end
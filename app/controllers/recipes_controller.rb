class RecipesController < ApplicationController
  
  	before_action :set_recipe, only: [:show, :edit, :update, :like]
  	before_action :require_same_user, only: [:edit, :update]
  	before_action :require_user_like, only: [:like]
  	before_action :require_user, except: [:show, :index, :like]
  	before_action :admin_user, only: :destroy
 
  
  def index
    @recipes = Recipe.paginate(page: params[:page], per_page: 3)
  end
  
  def show
    
  end
  
  def new
    @recipe = Recipe.new
  end
  
  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.chef = current_user
    
    if @recipe.save
      flash[:success] = "Recipe created successfully"
      redirect_to recipes_path
    
    else
      render :new
    end
  end
  
  def edit 
  
  end
  
  def destroy
    Recipe.find(params[:id]).destroy
    flash[:success] = "Recipe Deleted"
    redirect_to recipes_path
  end
  
  
  
  def update 
    if @recipe.update(recipe_params)
      flash[:success] = "recipe edited"
      redirect_to recipe_path(@recipe)
    
      else
       render :edit
    end
  end
  
  def like
  like = Like.create(like: params[:like], chef: current_user, recipe: @recipe)
  if like.valid?
  flash[:success] = "Your like was updated"
  redirect_to :back
  else
  flash[:danger] = "You can only like once"
  redirect_to :back
  end
  end
  
  
  
  

  private
  
    def recipe_params
      params.require(:recipe).permit(:name, :summary, :description, :picture, style_ids: [], ingredient_ids: [])
    end
    
    def set_recipe
       @recipe = Recipe.find(params[:id])
    end
    
  def require_same_user
    if current_user != @recipe.chef and !current_user.admin?
			flash[:danger] = "You can only edit your own recipe"
			redirect_to root_path
    end
  end
  
  def require_user_like
    if !logged_in?
      flash[:danger] = " You must be logged in to Like"
      redirect_to :back
    end
  end 
  def admin_user
    redirect_to recipe_path unless current_user.admin?
  end
    
end
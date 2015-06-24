require "test_helper"

class RecipeTest < ActiveSupport::TestCase
	
	def setup
		@recipe = Recipe.new(name: "chicken parm", summary: "the best chix arm", description: "text, cook, lbosoo")
	end
	 test "recipe should be valid" do
	 	assert @recipe.valid?
	 end
	 
	 test "name should be present" do
	 	@recipe.name = ""
	 	assert_not @recipe.valid?
	 	
	 end
	 
	 test "name not too long" do
	 	@recipr.name = "a" * 101
	 	assert_not @recipe.valid?
	 end
	 
	 test "name not to short" do
	 	@recipe.name = "aaaa"
	 	assert_not @recipe.valid?
	  end
	  
	  test "summary should be present" do
	  	@recipe.summary = ""
	  	assert_not @recipe.valid?
	  	
	  end
	 
	
	
end
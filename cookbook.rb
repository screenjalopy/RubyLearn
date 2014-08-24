class Cookbook
	attr_accessor :title
	attr_writer :steps
	attr_accessor :ingredients
	attr_accessor :recipes

	def initialize(title)
		@title = title
  		@recipes = []
	end

	def add_recipe(singleRecipe)
		@recipes.push(singleRecipe)
		puts "Added a recipe to the collection: #{singleRecipe.title}"
	end

	def recipe_titles # Veggie Burrito
		@recipes.each do |x|
			puts "#{x.title}"
		end
	end

	def recipe_ingredients # These are the ingredients for Veggie Burrito: ["tortilla", "bean"]
		@recipes.each do |x|
			puts "#{x.ingredients}"
		end
	end
end

class Recipe
  attr_accessor :title
  attr_accessor :steps
  attr_accessor :ingredients

  def initialize(title, ingredients, steps)
    @title = title
    @ingredients = ingredients
    @steps = steps
  end
end

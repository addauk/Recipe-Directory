require_relative './recipe'

class RecipeRepository

  # Selecting all records
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT id, recipe_name, cooking_time, rating FROM recipes;
    sql = 'SELECT id, recipe_name, cooking_time, rating FROM recipes;'
    results = DatabaseConnection.exec_params(sql,[])
    recipes = []
    results.each do |result|
      recipe = Recipe.new
      recipe.id = result['id']
      recipe.recipe_name = result['recipe_name']
      recipe.cooking_time = result['cooking_time']
      recipe.rating = result['rating']

      recipes << recipe
    end

    return recipes

    # Returns an array of Recipe objects.
  end

  # Gets a single record by its ID
  # One argument: the id (number)
  def find(id)
    # Executes the SQL query:
    # SELECT id, recipe_name, cooking_time, rating FROM recipes WHERE id = $1;
    sql =  'SELECT id, recipe_name, cooking_time, rating FROM recipes WHERE id = $1;'
    params = [2]

    results = DatabaseConnection.exec_params(sql,params)
    result = results[0]
    recipe = Recipe.new
    recipe.id = result['id']
    recipe.recipe_name = result['recipe_name']
    recipe.cooking_time = result['cooking_time']
    recipe.rating = result['rating']

    return recipe
    # Returns a single Recipe object.
  end

end
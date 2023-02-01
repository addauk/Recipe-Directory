require_relative '../lib/recipe_repository'

  
def reset_recipes_table
  seed_sql = File.read('spec/seeds_recipes.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'recipes_directory_test' })
  connection.exec(seed_sql)
end

RSpec.describe RecipeRepository do
  before(:each) do 
    reset_recipes_table
  end

  # (your tests will go here).

  it 'gets all recipes' do
        
    repo = RecipeRepository.new

    recipes = repo.all
    expect(recipes.length).to eq 2
    expect(recipes.first.id).to eq '1'
    expect(recipes.first.recipe_name).to eq 'Bread'
  end

  it 'finds a single recipe that matches the id given' do
    
    repo = RecipeRepository.new

    recipe = repo.find(2)
    expect(recipe.recipe_name).to eq "Water"



  end
end

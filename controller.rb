require_relative 'view'
require_relative 'recipe'

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

# USER ACTIONS
  def list
    display_recipes
  end

  def create
    # 1. Ask user for a name (view)
    name = @view.ask_user_for("name")
    # 2. Ask user for a description (view)
    description = @view.ask_user_for("description")
    # 3. Ask user for time prep (view)
    time_prep = @view.ask_user_for("time_prep")
    # 4. Create recipe (model)
    recipe = Recipe.new(name: name, description: description, time_prep: time_prep)
    # 5. Store in repo
    @cookbook.add(recipe)
    # 6. display
    display_recipes
  end

  def destroy
    # 1. display recipes
    display_recipes
    # 2. Ask user for index (view)
    index = @view.ask_user_for_index
    # 3. Remove from repo (cookbook)
    @cookbook.remove_at(index)
    # 4. display
    display_recipes
  end

  def mark_as_done
    # 1. diplay recipes
    display_recipes
    # 2. Ask user for an index (view)
    index = @view.ask_user_for_index
    # 3. mark as done and save in repo
    @cookbook.mark_recipe_as_done(index)
    # 4. display recipes
    display_recipes
  end

  private

  def display_recipes
    # 1-list recipes from repo
    recipes = @cookbook.all
    # 2-display recipes in view
    @view.display(recipes)
  end
end

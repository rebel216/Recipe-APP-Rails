class RecipeFoodsController < ApplicationController
  def new
    @recipe_food = RecipeFood.new
    @foods = Food.all
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = RecipeFood.new(recipe_id: params[:recipe_id],
                                  quantity:
                                  params.require(:recipe_food).permit(:quantity)[:quantity], food_id:
                                    params.require(:recipe_food).permit(:food_id)[:food_id])

    if @recipe_food.save
      redirect_to user_recipe_path(params[:user_id], params[:recipe_id])
    else
      render :new
    end
  end

  def destroy
    @recipe_food = RecipeFood.find(params[:id])
    @recipe_food.destroy
    redirect_to user_recipe_path(params[:user_id], params[:recipe_id])
  end

  def update
    @recipe_food = RecipeFood.find(params[:id])
    if @recipe_food.update(recipe_foods_params)
      flash[:success] = 'Recipe Food updated successfully.'
    else
      flash[:error] = 'Could not add'
    end
    redirect_to recipe_path(@recipe_food.recipe_id)
  end

  def edit
    @recipe_food = RecipeFood.find(params[:id])
  end

  rivate

  def recipe_foods_params
    params.require(:recipe_food).permit(:quantity, :food_id)
  end

end

class RecipesController < ApplicationController
  load_and_authorize_resource
  before_action :set_recipe, only: %i[show edit update destroy]
  before_action :authenticate_user!

  def index
    @recipes = Recipe.all
    # @user = User.find(params[:user_id])
    # Render custom views. I learnt this with laravel. Also available in rails
    # render "/reipes/index"
    # render template: "recipes/index"
  end

  def new
    @recipes = Recipe.new
  end

  def create
    @recipes = Recipe.new(recipe_params)
    @recipes.user_id = current_user.id
    if @recipes.save
      flash[:notice] = "Recipe #{@recipes.name} was successfully created"
      redirect_to recipes_path
    else
      render 'new'
    end
  end

  def show
    data = Recipe.where(id: params[:id])
    @recipe = data[0]
    @recipe_foods = Food.all.joins('INNER JOIN recipe_foods ON foods.id = recipe_foods.food_id')
      .order(created_at: :desc).select('foods.*, recipe_foods.quantity, recipe_foods.id as recipe_foods_id')
      .where(recipe_foods: { recipe_id: params[:id] })
    return unless current_user
  end

  def edit; end

  def update
    # @user = User.find(params[:id])
    if @recipes.update(recipe_params)
      flash[:notice] = 'Your receipt was successfully updated'
      redirect_to recipes_path
    else
      render 'edit'
    end
  end

  def destroy
    # @receipt = Recipe.find(params[:id])
    @recipes.destroy
    redirect_to recipes_path
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end

  def set_recipe
    @recipes = Recipe.find(params[:id])
  end
end

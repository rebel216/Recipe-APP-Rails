class PublicRecipesController < ApplicationController
  def index
    @recipes = Recipe.where(public: true)
    @price = find_price
  end

  def find_price
    price = 0
    recipe = Recipe.first
    recipe.foods.map { |rec| price += rec.price }
    price
  end

  def show
    @recipes = Recipe.find(params[:id])
  end
end

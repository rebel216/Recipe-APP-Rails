class RecipesController < ApplicationController
    load_and_authorize_resource
    before_action :set_recipe, only: [:show, :edit, :update, :destroy]

    def index
        @recipes = Recipe.all
        #@user = User.find(params[:user_id])
        #Render custom views. I learnt this with laravel. Also available in rails
        #render "/reipes/index"
        #render template: "recipes/index"
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

    end
    
    def edit

    end

    def update
        #@user = User.find(params[:id])
        if @recipes.update(recipe_params)
            flash[:notice] = "Your receipt was successfully updated"
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
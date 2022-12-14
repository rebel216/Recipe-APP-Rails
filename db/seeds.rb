# frozen_string_literal: true

u1 = User.create(name: 'User1', email: 'email1@mail.com', password: 'aaaaaa')
u2 = User.create(name: 'User2', email: 'email2@mail.com', password: 'aaaaaa')
u3 = User.create(name: 'User3', email: 'email3@mail.com', password: 'aaaaaa')
u4 = User.create(name: 'User4', email: 'email4@mail.com', password: 'aaaaaa')
u5 = User.create(name: 'User5', email: 'email5@mail.com', password: 'aaaaaa')

food1 = Food.create(name: 'Food1', measurement_unit: 'g', price: 10.5, quantity: 10, user_id: u1.id)
food2 = Food.create(name: 'Food2', measurement_unit: 'kg', price: 20.5, quantity: 20, user_id: u2.id)
food3 = Food.create(name: 'Food3', measurement_unit: 'g', price: 30, quantity: 30, user_id: u3.id)
food4 = Food.create(name: 'Food4', measurement_unit: 'kg', price: 40, quantity: 40, user_id: u4.id)
food5 = Food.create(name: 'Food5', measurement_unit: 'g', price: 50, quantity: 50, user_id: u5.id)

recipe1 = Recipe.create(name: 'Recipe1', preparation_time: 10, cooking_time: 20, description: 'Description1',
                        public: false, user_id: u1.id)
recipe2 = Recipe.create(name: 'Recipe2', preparation_time: 30, cooking_time: 40, description: 'Description2',
                        public: true, user_id: u2.id)
recipe3 = Recipe.create(name: 'Recipe3', preparation_time: 50, cooking_time: 60, description: 'Description3',
                        public: true, user_id: u3.id)
recipe4 = Recipe.create(name: 'Recipe4', preparation_time: 70, cooking_time: 80, description: 'Description4',
                        public: false, user_id: u4.id)
recipe5 = Recipe.create(name: 'Recipe5', preparation_time: 90, cooking_time: 100, description: 'Description5',
                        public: true, user_id: u5.id)

recipefood1 = RecipeFood.create(quantity: 10, food_id: food1.id, recipe_id: recipe1.id)
recipefood2 = RecipeFood.create(quantity: 20, food_id: food2.id, recipe_id: recipe2.id)
recipefood3 = RecipeFood.create(quantity: 30, food_id: food3.id, recipe_id: recipe3.id)
recipefood4 = RecipeFood.create(quantity: 40, food_id: food4.id, recipe_id: recipe4.id)
recipefood5 = RecipeFood.create(quantity: 50, food_id: food5.id, recipe_id: recipe5.id)
recipefood6 = RecipeFood.create(quantity: 60, food_id: food1.id, recipe_id: recipe1.id)
recipefood7 = RecipeFood.create(quantity: 70, food_id: food3.id, recipe_id: recipe2.id)
recipefood8 = RecipeFood.create(quantity: 80, food_id: food4.id, recipe_id: recipe1.id)
recipefood9 = RecipeFood.create(quantity: 90, food_id: food5.id, recipe_id: recipe2.id)
recipefood10 = RecipeFood.create(quantity: 100, food_id: food1.id, recipe_id: recipe1.id)

Ingredient.destroy_all

ingredients_database = ["flour", "sugar", "powdered sugar", "chocolate chips", "cocoa powder", "vanilla extract", "baking powder", "baking soda", "salt", "butter", "milk", "cream cheese", "egg", "vegetable oil"]

ingredients_database.each do |ingredient|
    Ingredient.create(name: ingredient)
end

User.create(username: "marissa", email: "marissa@gmail.com", password: "marissa123")
Pantry.create(user_id: 1)

recipe1 = {name: "Vanilla Cupcakes", prep_time: 20, cook_time: 14, ingredients_recipes_attributes: {
    "0": {input_name: "flour", quantity: "1-1/4 cups"}, 
    "1": {input_name: "baking powder", quantity: "1-1/4 tsp"},
    "2": {input_name: "baking soda", quantity: "1/2 tsp"},
    "3": {input_name: "salt", quantity: "1/2 tsp"},
    "4": {input_name: "egg", quantity: "2"},
    "5": {input_name: "sugar", quantity: "3/4 cup"},
    "6": {input_name: "vanilla extract", quantity: "1-1/2 tsp"},
    "7": {input_name: "oil", quantity: "1/2 cup"},
    "8": {input_name: "milk", quantity: "1/2 cup"}
}, directions: {
    "0": "Preheat the oven to 350°F and line a cupcake/muffin pan with cupcake liners.", 
    "1": "In a medium bowl, whisk together 1 1/4 cups cake flour (or Canadian flour), 1 1/4 tsp baking powder, 1/2 tsp baking soda and 1/2 tsp salt.", 
    "2": "In the bowl of an electric mixer, beat 2 eggs with the whisk attachment on medium speed (15-20 seconds).", 
    "3": "Add 3/4 cup sugar and continue to beat on medium speed (30 seconds).", 
    "4": "Add vanilla and oil and beat on medium speed (1 minute).", 
    "5": "Reduce mixer speed to medium/low and slowly add about half of the flour mixture, mixing until incorporated. Add half of the buttermilk and mix until incorporated. Repeat with remaining flour and buttermilk. Beat until just combined and smooth, scraping down the sides of the mixing bowl as needed. The batter will be thin.", 
    "6": "Pour batter into a lined muffin pan. Fill to about 1/2 full (Do-Not overfill).", 
    "7": "Bake for 12 -14 minutes at 350 °F or until a toothpick inserted in the center comes out clean. Let them cool in the pan for a couple minutes, then remove. Once the cupcakes are cooled to room temp, pipe on the frosting."}}

recipe2 = {name: "Chocolate Chip Cookies", prep_time: 20, cook_time: 10, ingredients_recipes_attributes: {
    "0": {input_name: "butter", quantity: "1 cup"}, 
    "1": {input_name: "sugar", quantity: "2 cups"},
    "2": {input_name: "egg", quantity: "2"}, 
    "3": {input_name: "vanilla extract", quantity: "2 tsp"}, 
    "4": {input_name: "baking soda", quantity: "1 tsp"}, 
    "5": {input_name: "water", quantity: "2 tsp"}, 
    "6": {input_name: "salt", quantity: "1/2 tsp"}, 
    "7": {input_name: "flour", quantity: "3 cups"}, 
    "8": {input_name: "chocolate chips", quantity: "2 cups"}, 
    "9": {input_name: "walnuts", quantity: "1 cup"}
}, directions: {
    "0": "Preheat oven to 350 degrees F.", 
    "1": "Cream together the butter, white sugar, and brown sugar until smooth.", 
    "2": "Beat in the eggs one at a time, then stir in the vanilla.", 
    "3": "Dissolve baking soda in hot water. Add to batter along with salt.", 
    "4": "Stir in flour, chocolate chips, and nuts.", 
    "5": "Drop by large spoonfuls onto ungreased pans.", 
    "6": "Bake for about 10 minutes in the preheated oven, or until edges are nicely browned."}}

recipe3 = {name: "Pecan Pie", prep_time: 20, cook_time: 60, ingredients_recipes_attributes: {
    "0": {input_name: "sugar", quantity: "1-3/4 cups"}, 
    "1": {input_name: "corn syrup", quantity: "1/4 cup"}, 
    "2": {input_name: "butter", quantity: "1/4 cup"}, 
    "3": {input_name: "water", quantity: "1 tbs"}, 
    "4": {input_name: "cornstarch", quantity: "2 tsp"}, 
    "5": {input_name: "egg", quantity: "3"}, 
    "6": {input_name: "salt", quantity: "1/4 tsp"}, 
    "7": {input_name: "vanilla extract", quantity: "1 tsp"}, 
    "8": {input_name: "pecans", quantity: "1-1/4 cups"}, 
    "9": {input_name: "pie shell", quantity: "1"}
}, directions: {
    "0": "Preheat oven to 350 degrees F.", 
    "1": "In a medium saucepan, combine the sugar, corn syrup, butter, water, and cornstarch. Bring to a full boil, and remove from heat.", 
    "2": "In a large bowl, beat eggs until frothy. Gradually beat in cooked syrup mixture. Stir in salt, vanilla, and pecans. Pour into pie shell.", 
    "3": "Bake in preheated oven for 45 to 50 minutes, or until filling is set."}}

recipes = [recipe1, recipe2, recipe3]

recipes.each do |recipe|
    new_recipe = Recipe.create(name: recipe[:name], prep_time: recipe[:prep_time], cook_time: recipe[:cook_time], user_id: User.find_by(username: "marissa").id)
    new_recipe.directions = recipe[:directions].values
    recipe[:ingredients_recipes_attributes].each do |id,ingredient|
        current_ingredient = Ingredient.find_or_create_by(name: ingredient[:input_name].downcase)
        new_recipe.ingredients_recipes.build(ingredient_id: current_ingredient.id, recipe_id: new_recipe.id, input_name: ingredient[:input_name], quantity: ingredient[:quantity])
    end
    new_recipe.save
end
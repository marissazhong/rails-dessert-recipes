
ingredients_database = ["flour", "sugar", "powdered sugar", "chocolate chips", "cocoa powder", "vanilla extract", "baking powder", "baking soda", "salt", "butter", "milk", "cream cheese", "egg", "vegetable oil"]

ingredients_database.each do |ingredient|
    Ingredient.create(name: ingredient)
end

User.create(username: "marissa", email: "marissa@gmail.com", password: "marissa123")

recipe1 = {name: "Vanilla Cupcakes", prep_time: 20, cook_time: 14, ingredients_recipes_attributes: {
    "0": {input_name: "flour", quantity: "1.25 cups"}, 
    "1": {input_name: "baking powder", quantity: "1.25 tsp"},
    "2": {input_name: "baking soda", quantity: "1/2 tsp"},
    "3": {input_name: "salt", quantity: "1/2 tsp"},
    "4": {input_name: "egg", quantity: "2"},
    "5": {input_name: "sugar", quantity: "3/4 cup"},
    "6": {input_name: "vanilla extract", quantity: "1.5 tsp"},
    "7": {input_name: "oil", quantity: "1/2 cup"},
    "8": {input_name: "milk", quantity: "1/2 cup"}
}}

recipes = [recipe1]

recipes.each do |recipe|
    new_recipe = Recipe.create(name: recipe["name"], prep_time: recipe["prep_time"], cook_time: recipe["cook_time"], user_id: User.find_by(name: "marissa").id)
    recipe[:ingredients_recipes_attributes].each do |id,ingredient|
        current_ingredient = Ingredient.find_or_create_by(name: ingredient["input_name"].downcase)
        new_recipe.ingredients_recipes.build(ingredient_id: current_ingredient.id, recipe_id: new_recipe.id, input_name: ingredient["input_name"], quantity: ingredient["quantity"])
    end
    new_recipe.save
end
# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project: Yes.
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Recipes): Recipes and ingredients have a many-to-many relationship, as well pantries and ingredients.
- [x] Include at least one belongs_to relationship (x belongs_to y e.g. Post belongs_to User): Recipes and pantries both belong to a user.
- [x] Include at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients): Both many-to-many relationships include a join table as shown with the has_many :through associations on the model files.
- [x] The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity): The ingredients_recipes join table includes quantity.
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item): User, Recipe, and Ingredient have simple validations (name, password presence true).
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes): I have included a filter to show only recipes that can be made with pantry's ingredients.
- [x] Include signup (how e.g. Devise): I have built an authentication system with bcrypt for secure password. 
- [x] Include login (how e.g. Devise): I have built an authentication system with bcrypt for secure password. Session is created with login.
- [x] Include logout (how e.g. Devise): I have built an authentication system with bcrypt for secure password. Session is destroyed with logout.
- [x] Include third party signup/login (how e.g. Devise/OmniAuth): I have included login with Facebook.
- [x] Include nested resource show or index (URL e.g. users/2/recipes): I have included recipes resources nested under users. 
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients): User can access new recipes from users page (users/2/recipes/new).
- [x] Include form display of validation errors (form URL e.g. /recipes/new): Error messages are displayed with errors.full_messages.

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate
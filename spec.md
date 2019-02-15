# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Recipes)  
A user has many builds, parts_lists, likes, comments   
- [x] Include at least one belongs_to relationship (x belongs_to y e.g. Post belongs_to User)  
A build, parts_list, a like, a comment, all belong to a user  
- [x] Include at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients)  
A build has many likers, and a user has many liked_builds  
- [x] The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity)  
Builds are user submitted
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)  
Parts Lists and Builds have validations
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)  
Build.oldest, Build.newest, Build.most_liked
- [x] Include signup (how e.g. Devise)  
Devise, Facebook
- [x] Include login (how e.g. Devise)  
Devise
- [x] Include logout (how e.g. Devise)  
Devise
- [x] Include third party signup/login (how e.g. Devise/OmniAuth)  
Devise Omniauth
- [x] Include nested resource show or index (URL e.g. users/2/recipes)  
users/builds users/parts_lists
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)  
users/1/parts_lists/new
- [x] Include form display of validation errors (form URL e.g. /recipes/new)  
/parts_lists/new

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate


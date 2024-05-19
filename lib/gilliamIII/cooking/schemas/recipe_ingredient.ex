defmodule GilliamIII.Cooking.Schemas.RecipeIngredient do
  alias GilliamIII.Cooking.Schemas

  use Ecto.Schema

  schema "recipe_ingredients" do
    field :amount, :integer
    field :unit, :string
    belongs_to :ingredient, Schemas.Ingredient, foreign_key: :ingredient_id
    belongs_to :recipe, Schemas.Recipe, foreign_key: :recipe_id
  end
end

defmodule GilliamIII.Cooking.Schemas.Recipe do
  alias GilliamIII.Cooking.Schemas
  use Ecto.Schema

  schema "recipes" do
    field :name, :string
    field :instructions, :string
    has_many :recipe_ingredients, Schemas.RecipeIngredient, foreign_key: :recipe_id
  end
end

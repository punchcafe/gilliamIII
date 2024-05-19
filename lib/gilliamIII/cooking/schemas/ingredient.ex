defmodule GilliamIII.Cooking.Schemas.Ingredient do
  use Ecto.Schema

  schema "ingredients" do
    field :name, :string
  end
end

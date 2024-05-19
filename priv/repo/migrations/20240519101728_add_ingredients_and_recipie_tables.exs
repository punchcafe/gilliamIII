defmodule GilliamIII.Repo.Migrations.AddIngredientsAndrecipeTables do
  use Ecto.Migration

  def change do
    create table("ingredients") do
      add :name, :string, size: 80
    end

    create index("ingredients", [:name])

    create table("recipes") do
      add :name, :string, size: 80
      add :instructions, :text
    end

    create index("recipes", [:name])

    create table("recipe_ingredients") do
      add :amount, :integer
      add :unit, :string, size: 20
      add :recipe_id, references("ingredients")
      add :ingredient_id, references("ingredients")
    end
  end
end

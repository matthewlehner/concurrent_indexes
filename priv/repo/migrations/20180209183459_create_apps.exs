defmodule ConcurrentIndexes.Repo.Migrations.CreateApps do
  use Ecto.Migration

  def change do
    create_if_not_exists table(:apps) do
      add(:title, :string)
      add(:identifier, :string)

      timestamps()
    end
  end
end

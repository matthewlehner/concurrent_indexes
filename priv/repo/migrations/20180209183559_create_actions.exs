defmodule ConcurrentIndexes.Repo.Migrations.CreateActions do
  use Ecto.Migration

  def change do
    create_if_not_exists table(:actions) do
      add(:identifier, :string)
      add(:app_id, references(:apps, on_delete: :delete_all))

      timestamps()
    end
  end
end

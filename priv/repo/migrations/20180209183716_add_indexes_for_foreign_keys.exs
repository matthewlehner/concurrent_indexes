defmodule ConcurrentIndexes.Repo.Migrations.AddIndexesForForeignKeys do
  use Ecto.Migration
  @disable_ddl_transaction true

  def change do
    create_if_not_exists(index("actions", [:app_id], concurrently: true))
  end
end

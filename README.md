# ConcurrentIndexes

This is a minimal Phoenix app that illustrates how indexes cannot be added
concurrently using Postgres.

* Clone the repo
* Install dependencies `mix deps.get`
* create the database `mix ecto.create`
* run the migrations `mix ecto.migrate`

On Postgres 10.1 you'll have the following stack trace:

```
[info] == Running ConcurrentIndexes.Repo.Migrations.AddIndexesForForeignKeys.change/0 forward
[info] create index if not exists actions_app_id_index
** (Postgrex.Error) ERROR 25001 (active_sql_transaction): CREATE INDEX CONCURRENTLY cannot run inside a transaction block
    (ecto) lib/ecto/adapters/sql.ex:200: Ecto.Adapters.SQL.query!/5
    (ecto) lib/ecto/adapters/postgres.ex:85: anonymous fn/4 in Ecto.Adapters.Postgres.execute_ddl/3
    (elixir) lib/enum.ex:1899: Enum."-reduce/3-lists^foldl/2-0-"/3
    (ecto) lib/ecto/adapters/postgres.ex:85: Ecto.Adapters.Postgres.execute_ddl/3
    (ecto) lib/ecto/migration/runner.ex:104: anonymous fn/2 in Ecto.Migration.Runner.flush/0
    (elixir) lib/enum.ex:1899: Enum."-reduce/3-lists^foldl/2-0-"/3
    (ecto) lib/ecto/migration/runner.ex:102: Ecto.Migration.Runner.flush/0
    (stdlib) timer.erl:181: :timer.tc/2
    (ecto) lib/ecto/migration/runner.ex:26: Ecto.Migration.Runner.run/6
    (ecto) lib/ecto/migrator.ex:128: Ecto.Migrator.attempt/6
    (ecto) lib/ecto/migrator.ex:73: anonymous fn/4 in Ecto.Migrator.do_up/4
    (ecto) lib/ecto/migrator.ex:261: anonymous fn/4 in Ecto.Migrator.migrate/4
    (elixir) lib/enum.ex:1294: Enum."-map/2-lists^map/1-0-"/2
    (ecto) lib/mix/tasks/ecto.migrate.ex:83: anonymous fn/4 in Mix.Tasks.Ecto.Migrate.run/2
    (elixir) lib/enum.ex:737: Enum."-each/2-lists^foreach/1-0-"/2
    (elixir) lib/enum.ex:737: Enum.each/2
    (mix) lib/mix/task.ex:314: Mix.Task.run_task/3
    (mix) lib/mix/cli.ex:80: Mix.CLI.run_task/2
```

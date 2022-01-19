defmodule Hello.Repo.Migrations.CreateMetricInstances do
  use Ecto.Migration

  def change do
    create table(:metric_instances) do
      add :metric, references(:metrics, on_delete: :nothing)

      timestamps()
    end

    create index(:metric_instances, [:metric])
  end
end

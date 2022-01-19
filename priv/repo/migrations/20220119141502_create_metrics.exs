defmodule Hello.Repo.Migrations.CreateMetrics do
  use Ecto.Migration

  def change do
    create table(:metrics) do
      add :name, :string
      add :owner, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:metrics, [:owner])
  end
end

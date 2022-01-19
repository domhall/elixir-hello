defmodule Hello.Metric do
  use Ecto.Schema
  import Ecto.Changeset

  schema "metrics" do
    field :name, :string
    field :owner, :id

    timestamps()
  end

  @doc false
  def changeset(metric, attrs) do
    metric
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end

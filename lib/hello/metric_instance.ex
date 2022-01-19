defmodule Hello.MetricInstance do
  use Ecto.Schema
  import Ecto.Changeset

  schema "metric_instances" do

    field :metric, :id

    timestamps()
  end

  @doc false
  def changeset(metric_instance, attrs) do
    metric_instance
    |> cast(attrs, [])
    |> validate_required([])
  end
end

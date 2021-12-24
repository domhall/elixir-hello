defmodule Hello.Person do
  use Ecto.Schema
  import Ecto.Changeset

  schema "people" do

    field :user_id, :id
    field :role_id, :id

    timestamps()
  end

  @doc false
  def changeset(person, attrs) do
    person
    |> cast(attrs, [])
    |> validate_required([])
  end
end

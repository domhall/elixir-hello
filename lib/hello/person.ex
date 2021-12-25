defmodule Hello.Person do
  use Ecto.Schema
  import Ecto.Changeset

  schema "people" do
    belongs_to :user, Hello.Accounts.User
    belongs_to :role, Hello.Role

    timestamps()
  end

  @doc false
  def changeset(person, attrs) do
    person
    |> cast(attrs, [])
    |> validate_required([])
  end
end

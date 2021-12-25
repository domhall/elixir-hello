defmodule Hello.Role do
  use Ecto.Schema
  import Ecto.Query
  import Ecto.Changeset

  schema "roles" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(role, attrs) do
    role
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end

  @doc """
  finds roles assigned to a user
  """
  def get_roles_by_user_id(user_id) do
    query =
      from person in Hello.Person,
        where: person.user_id == ^user_id,
        join: role in assoc(person, :role),
        select: role

    Hello.Repo.all(query)
  end
end

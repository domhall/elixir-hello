defmodule Hello.Repo.Migrations.AddDefaultRoles do
  use Ecto.Migration
  import Ecto.Query, only: [from: 2]

  defp insertRoles([]), do: :ok

  defp insertRoles([roleName | roles]) do
    Hello.Repo.insert!(%Hello.Role{name: roleName})
    insertRoles(roles)
  end

  defp deleteRoles([]), do: :ok

  defp deleteRoles([roleName | roles]) do
    Ecto.Query.from(role in Hello.Role, where: role.name == ^roleName)
    |> Hello.Repo.delete_all()

    deleteRoles(roles)
  end

  def up do
    insertRoles(["admin", "user"])
  end

  def down do
    deleteRoles(["admin", "user"])
  end
end

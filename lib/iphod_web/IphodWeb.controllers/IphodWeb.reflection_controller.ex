defmodule IphodWeb.ReflectionController do
  use IphodWeb, :controller

  alias Iphod.Reflection
<<<<<<< HEAD
  alias Iphod.Router.Helpers, as: Routes
=======
>>>>>>> iphod/master

  plug :scrub_params, "reflection" when action in [:create, :update]

  def index(conn, _params) do
<<<<<<< HEAD
    reflections = Repo.all(from(r in Reflection, order_by: :date))
=======
    reflections = Repo.all from r in Reflection, order_by: :date
>>>>>>> iphod/master
    render(conn, "index.html", reflections: reflections, page_controller: "reflection")
  end

  def new(conn, _params) do
    changeset = Reflection.changeset(%Reflection{})
    render(conn, "new.html", changeset: changeset, page_controller: "reflection")
  end

  def create(conn, %{"reflection" => reflection_params}) do
    changeset = Reflection.changeset(%Reflection{}, reflection_params)

    case Repo.insert(changeset) do
      {:ok, _reflection} ->
        conn
        |> put_flash(:info, "Reflection created successfully.")
<<<<<<< HEAD
        |> redirect(to: Routes.reflection_path(conn, :index))

=======
        |> redirect(to: reflection_path(conn, :index))
>>>>>>> iphod/master
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset, page_controller: "reflection")
    end
  end

  def show(conn, %{"id" => id}) do
    reflection = Repo.get!(Reflection, id)
    render(conn, "show.html", reflection: reflection, page_controller: "reflection")
  end

  def edit(conn, %{"id" => id}) do
    reflection = Repo.get!(Reflection, id)
    changeset = Reflection.changeset(reflection)
<<<<<<< HEAD

    render(conn, "edit.html",
      reflection: reflection,
      changeset: changeset,
      page_controller: "reflection"
    )
=======
    render(conn, "edit.html", reflection: reflection, changeset: changeset, page_controller: "reflection")
>>>>>>> iphod/master
  end

  def update(conn, %{"id" => id, "reflection" => reflection_params}) do
    reflection = Repo.get!(Reflection, id)
    changeset = Reflection.changeset(reflection, reflection_params)

    case Repo.update(changeset) do
      {:ok, reflection} ->
        conn
        |> put_flash(:info, "Reflection updated successfully.")
<<<<<<< HEAD
        |> redirect(to: Routes.reflection_path(conn, :show, reflection))

      {:error, changeset} ->
        render(conn, "edit.html",
          reflection: reflection,
          changeset: changeset,
          page_controller: "reflection"
        )
=======
        |> redirect(to: reflection_path(conn, :show, reflection))
      {:error, changeset} ->
        render(conn, "edit.html", reflection: reflection, changeset: changeset, page_controller: "reflection")
>>>>>>> iphod/master
    end
  end

  def delete(conn, %{"id" => id}) do
    reflection = Repo.get!(Reflection, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(reflection)

    conn
    |> put_flash(:info, "Reflection deleted successfully.")
<<<<<<< HEAD
    |> redirect(to: Routes.reflection_path(conn, :index))
=======
    |> redirect(to: reflection_path(conn, :index))
>>>>>>> iphod/master
  end
end

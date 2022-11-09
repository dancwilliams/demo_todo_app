defmodule DemoTodoApp.Repo do
  use Ecto.Repo,
    otp_app: :demo_todo_app,
    adapter: Ecto.Adapters.Postgres
end

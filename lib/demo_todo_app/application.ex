defmodule DemoTodoApp.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      DemoTodoAppWeb.Telemetry,
      # Start the Ecto repository
      DemoTodoApp.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: DemoTodoApp.PubSub},
      # Start Finch
      {Finch, name: DemoTodoApp.Finch},
      # Start the Endpoint (http/https)
      DemoTodoAppWeb.Endpoint
      # Start a worker by calling: DemoTodoApp.Worker.start_link(arg)
      # {DemoTodoApp.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: DemoTodoApp.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    DemoTodoAppWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end

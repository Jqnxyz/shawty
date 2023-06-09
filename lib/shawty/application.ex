defmodule Shawty.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      ShawtyWeb.Telemetry,
      # Start the Ecto repository
      Shawty.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Shawty.PubSub},
      # Start Finch
      {Finch, name: Shawty.Finch},
      # Start the Endpoint (http/https)
      ShawtyWeb.Endpoint
      # Start a worker by calling: Shawty.Worker.start_link(arg)
      # {Shawty.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Shawty.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ShawtyWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end

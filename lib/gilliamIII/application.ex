defmodule GilliamIII.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      GilliamIIIWeb.Telemetry,
      GilliamIII.Repo,
      {DNSCluster, query: Application.get_env(:gilliamIII, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: GilliamIII.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: GilliamIII.Finch},
      # Start a worker by calling: GilliamIII.Worker.start_link(arg)
      # {GilliamIII.Worker, arg},
      # Start to serve requests, typically the last entry
      GilliamIIIWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: GilliamIII.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    GilliamIIIWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end

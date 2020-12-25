defmodule BlockchainWorker.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: BlockchainWorker.Worker.start_link(arg)
      # {BlockchainWorker.Worker, arg}
      {Plug.Cowboy, scheme: :http, plug: BlockchainWorker.Router, options: [port: 4002]}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: BlockchainWorker.Supervisor]
    Supervisor.start_link(children, opts)
  end
end

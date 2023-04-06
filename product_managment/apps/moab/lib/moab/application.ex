defmodule Moab.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do

    children = [
      # Starts a worker by calling: Moab.Worker.start_link(arg)
      # {Moab.Worker, arg}
      {Moab.Server, name: Moab.Server },
      {ConCache, [name: :simple_cache, ttl_check_interval: false] }
      {Moab.Repo, name: Moab.Repo }
    ]

    opts = [strategy: :one_for_one, name: Moab.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Simulate login - logout here
  # create a random seed data and persist in ETS


  # one thing I would like to do here is to persist the session data in ETS
  # Eventaully the ETS can be a complete cache of session data that can be
  # made durable in Mnesia in case a crash happens

  # All modules then refer to the session data to partition/filter anything they perform

end

defmodule Gencounter.Application do
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = basic()
    opts = [strategy: :one_for_one, name: Gencounter.Supervisor]
    Supervisor.start_link(children, opts)
  end

  defp basic do
    [
      #{Gencounter.Producer, 0},
      #{Gencounter.ProducerConsumer, 2},
      #Gencounter.Consumer
    ]
  end
end

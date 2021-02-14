defmodule Gencounter.Consumer do
  use GenStage

  @name __MODULE__

  def start_link(_), do: GenStage.start_link(@name, :state, name: @name)

  # def init(state), do: {:consumer, state, subscribe_to: [Gencounter.ProducerConsumer]}
  def init(state), do: {:consumer, state}

  def handle_events(events, _from, state) do
    for event <- events do
      IO.inspect({self(), event, state})
    end
    {:noreply, [], state}
  end
end

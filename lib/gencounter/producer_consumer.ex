defmodule Gencounter.ProducerConsumer do
  use GenStage
  require Integer

  @name __MODULE__

  def start_link(_), do: GenStage.start_link(@name, :state, name: @name)

  # def init(number), do: {:producer_consumer, number, subscribe_to: [Gencounter.Producer]}
  def init(number), do: {:producer_consumer, number}

  def handle_events(events, _from, number) do
    numbers =
      for event <- events,
          entry <- event..(event + number),
          do: entry
      {:noreply, numbers, number}
  end

#  def handle_events(events, _from, number) do
#    numbers =
#      events
#      |> Enum.filter(&Integer.is_even/1)
#
#    {:noreply, numbers, number}
#  end
end

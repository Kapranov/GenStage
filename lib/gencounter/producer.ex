defmodule Gencounter.Producer do
  use GenStage

  @name __MODULE__

  def start_link(init \\ 0), do: GenStage.start_link(@name, init, name: @name)

  def init(counter), do: {:producer, counter}

  def handle_demand(demand, counter) when demand > 0 do
    events = Enum.to_list(counter..(counter + demand - 1))
    {:noreply, events, (counter + demand)}
  end
end

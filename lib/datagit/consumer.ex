defmodule Datagit.Consumer do
  use GenStage

  def start_link(_opt) do
    GenStage.start_link(__MODULE__, :state_doesnt_matter, name: __MODULE__)
  end

  def init(state), do: {:consumer, state, subscribe_to: [Datagit.ProducerConsumer]}

  def handle_events([events], _from, state) do
    IO.inspect(events, limit: :infinity)

    {:noreply, [], state}
  end
end

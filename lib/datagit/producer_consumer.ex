defmodule Datagit.ProducerConsumer do
  use GenStage

  def start_link(_opt) do
    GenStage.start_link(__MODULE__, :state_doesnt_matter, name: __MODULE__)
  end

  def init(state), do: {:producer_consumer, state, subscribe_to: [Datagit.Producer]}

  def handle_events([answer], _from, state) do
    {:ok, list} = Jason.decode(answer.body)
    map = parse_list(list, %{})

    {:noreply, [map], state}
  end

  defp parse_list([], map), do: map

  defp parse_list([%{"login" => login, "avatar_url" => url} | tail], map) do
    map = Map.put(map, login, url)
    parse_list(tail, map)
  end
end

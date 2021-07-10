defmodule Datagit.Producer do
  use GenStage

  def start_link(initial \\ 0) do
    GenStage.start_link(__MODULE__, initial, name: __MODULE__)
  end

  def init(count), do: {:producer, count}

  def handle_demand(_demand, state) do
    {:ok, answer} = 
      HTTPoison.get("https://api.github.com/users?since=0&per_page=100")

    {:noreply, [answer], state}
  end
end

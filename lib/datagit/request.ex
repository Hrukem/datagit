defmodule Datagit.Request do
  def request() do
    {:ok, answer1} = HTTPoison.get("https://api.github.com/users?since=0&per_page=100")
    {:ok, answer2} = HTTPoison.get("https://api.github.com/users?since=99&per_page=100")
    {:ok, answer3} = HTTPoison.get("https://api.github.com/users?since=199&per_page=100")
    {:ok, list1} = Jason.decode(answer1.body)
    {:ok, list2} = Jason.decode(answer2.body)
    {:ok, list3} = Jason.decode(answer3.body)
    r1 = parse_map(list1, %{})
    r2 = parse_map(list2, %{})
    r3 = parse_map(list3, %{})
    IO.inspect(r1, limit: :infinity)
    IO.inspect(r2, limit: :infinity)
    IO.inspect(r3, limit: :infinity)
  end

  defp parse_map([], result), do: result 

  defp parse_map([%{"login" => login, "avatar_url" => url} | tail], result) do
    result = Map.put(result, login, url)
    parse_map(tail, result)
  end
end

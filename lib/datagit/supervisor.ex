defmodule Datagit.Supervisor1 do
  use Supervisor

  def start() do
    init(:ok)
  end

  def init(_arg) do
    children = [
      {Datagit.Producer, 0},
      {Datagit.ProducerConsumer, []},
      {Datagit.Consumer, []}
    ]

    opts = [strategy: :one_for_one, name: __MODULE__]
    Supervisor.start_link(children, opts)
  end
end

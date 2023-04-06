defmodule Product.Server do
  use GenServer
  alias Product.Basic.Impl

  def init(:empty) do
    {:ok, :empty} #just for fun
  end

  # calls:
  # show_all_products
  # show_one_product
  # show_select_products
  # show_latest_products
  #

  # request, from, state -> {:reply, result, :new_state}
  # def handle_call()
end

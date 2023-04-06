defmodule Products do
  # This is the API - the client in Elixir
  @server Product.Server

  def start_link(_) do
    GenServer.start_link(@server, nil, name: @server)
  end

  def show_all_products() do
    GenServer.call(@server, :show_all_products)
  end

  # pass in the product data as json
  def create_a_product({_}) do
    GenServer.call(@server, :creat_a_product)
  end

  # no!
  def update_all_products() do
    # no_op -- never allow anything 'all' from an app
  end

end

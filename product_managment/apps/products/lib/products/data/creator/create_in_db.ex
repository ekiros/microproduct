defmodule Product.Data.Creator.DB do

  @moduledoc """
  Create new Product Model and persist that model in the backing database. This new model is also
  saved to the append-only db

  The product creation will use serveral modules (is a composition) to compose a product. These modules
  are not necessarily visibly related to a product but are logically related and necessary to hava a
  product that makes sense. The base product is a new product that is being built as v1. The base product
  is used to create more of itslef (versions) which we call Inventory in Moab.

- creates the base inventory:

  product_inventory

  """

  alias Product.Data.Model.DB as: db_model


  def add_base_product({product:info}) do
    # validate data
    # clean up
    # reject or insert data


  end

  # sub-product or versioned product creation
  def add_versioned_product({product:base, inventory:info}) do

  end


  # upon new product creation this is called automatically
  defp init_versioned_product({product:base, inventory:info}) do

  end


end

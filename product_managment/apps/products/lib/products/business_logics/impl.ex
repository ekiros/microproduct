defmodule Product.Basic.BL do

  @moduledoc """
  Basic business logic implementations for the Products module. The basic business module may use
  various data models that are peristed in a DB or ETS/Mnesia

  @since: "1.0.0"
  @name: "product"
  @depends: "none" #this can be driven by using the module it calls
  @hascli: "false"
  @hasgui: "true"
  """

  # The following shoud disappear. This module should not know the internals of a data model - it should smimply call
  # a Creator or Mutator module
  alias Product.Data.Model.DB, as: a_db_product

  alias Product.Data.{Mutator, Creator, Reader}

  require Logger

  @doc """
  Products queries use a set of fixed filters. These filters are
  - Date range (for creation/modification)
  - All my products
  - All my team's products
  - Product by ID
  - Product by name
  Show all the product pipeline for the Product group. The user of Moab is the currently logged in
  authenticated user. The session or context (via Phoenix) provides authenticated user's (or system's) data.
  We should always check for that. However, just to make sure, we ask calling functions to pass the
  user. If the user is an admin or a privileged user, they can see all exsting pipelines. This function
  returns an array of products filtered by the current user's acl. Get the pipeline and cache locally
  """
  def product(filter) do

  end

  def my_product_pipeline() do
  end

  def my_teams_product_pipelines() do
  end

  @doc """
  Give a product type (String.t), this function will return all products that match this type. The product model
  returned is filterd by the current user
  """
  def product_by_type(product_type) do
    # ask for all products I own and filter here by type
  end

  @doc """
  Given a product name (String.t), this function will return all products that match this name. The product model
  returned is filterd by the current user.
  """
  def product_by_name(product_name) do
  end

  # Get product model details - field by field

  @doc """
  Given a product model, return the name of the product
  """
  def product_name(model) do
    IO.puts """
     get_property(): getting product properties for name product_name
    """
    model.product_name
  end

  def description(model) do
    IO.puts """
     get_property(): getting product properties for descritpion
    """
    model.description
  end

  def primary_benefit(model) do
    IO.puts """
     get_property(): getting product primary benefit
    """
    model.benefits.primary
  end

  def set_product_default_properties do
    IO.puts """
     Setting product properties...
    """

    %a_product{
      product_name: "Zumv",
      product_manager: "ekiros",
      description: "What a world and what has been",
      business_goals_description: "Y-o-Y bottomline increase by 15%",
      success_metrics_description: "Increase NAS by 20%",
      product_leaders: "Shamu, Bobo, Gam, Goat",
      product_type: "new",
      product_phase: "maintenance",
      created_by: "ekiros",
      tenant_id: "UUID000-898-KIOPO-MOMWOIE-09IN",
      benefits: %{ primary: "Good work", performance: "Faster" }
    }
  end

  @doc """
  This is an in-memory update and does not persist its changes. In order to perist any change the Product Mutator
  must be used. We can keep mutating the product in memory until we decide to persist the mutations or discard them.
  """
  def update_product_name(model, new_name) do
    IO.puts """
     updating product name property to [#{new_name}] from [#{model.product_name}]
    """
    %{model | product_name: new_name}
    # returns the updated product model
    model
  end


  defp persist_product_updates(model) do

  end

  @doc """
  we delete the data right away, but everything is persisted in a append only Mnesia DB
  """
  def delete_product(model) do
    IO.puts """
     deleting a product [#{model.product_name}]
    """

  end

  def print_product(model) do
    IO.puts """
     Inspecting product struct...
    """

    IO.inspect(model)
  end

end

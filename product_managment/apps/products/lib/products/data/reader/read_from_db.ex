defmodule Product.Data.Reader.DB do

  import Product.Data.Model.DB


  @moduledoc """
  This module is a readonly module (data accessor). It can be used to read the Products data model initially.
  However, it can also be used to read any other data models that are related (within one degree) to the Product data model
  such as Features. This is entire model reader (joined models or just Product); it does not read or return field by field
  readout -- that is the task of the BL module. The Reader will not access data models that are not related to the
  Poduct model. We do not read a field in Moab -- reads are logical and have to make a business sense.
  """

  def product(filters) do
    # do filter validation, clean up. May be session validation too before going to DB layer
    # returns a product (or multiples of products) and can be chanined with the following
  end


  # drillable but goes throguh another reader
  def product_versions(product) do
    # returns version (current, planned), name -> Drill on the UI to get more details
  end

  def product_leaders(product) do

    # returns leaders name, role
  end

  def business_goal_kpis(product) do

    # reurns name, list of KPI's (historic)
  end

  def success_metrics(product) do

  end

  def dependencies(product) do

    # returns dependant list and dependence list (may be historic)
  end

  # can be called by a product to get its related personas
  def personas(product) do

  end


  # if any...
  def related_products(product) do

  end

end

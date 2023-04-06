defmodule Product.Data.Model.DB do
  use Ecto.Schema

  @moduledoc """
  A Struct representing a Product
  """

  @typedoc """
  Product to be built or maintained.

  The base product
  has base data fields it maintains:

- required:

  product_name
  product_manager
  product_owner
  business_strategy
  description
  average_maintenance_cost
  financial_modeling
  gtm_strategy
  positioning
  pre_post_mortem
  estimated_cost_new
  product_phase (LU)
  type (LU)
  prevalent_users (LU)
  red_flags (LU)
  anticipated_challenges (LU)
  investment_type (LU)
  benefits (JSON)
  addressable_market_size (JSON)
  comments (JSON)

- defaults:

  date_created (defaulted by the db)
  date_modified (defaulted by db upon data modification)

- session data: (never passed by the user -- if so, are noted and ignored)

  modified_by (defaulted from session)
  created_by (defaulted from session)
  customer_id (defaulted from session)

- external dependencies:

 business_goals (product has one or many business goals)
 product_dependencies (product has one or many dependencies)
 success_metrics (product has one success metric)
 product_leaders (product has one group of leaders)
 product_personas -> persona (product has one main persona and possibly many secondary ones)
 product_inventory -> Create version 1.0 of the base product

"""

  schema "produts" do
    field :product_name,  :string,
    field :product_manager, String.t(), enforce: true
    field :product_owner, String.t(), enforce: false
    field :business_strategy, String.t(), enforce: false
    field :description, String.t(), enforce: true
    field :average_maintenance_cost, float(), enforce: false
    field :estimated_cost_new, float(), enforce: false
    field :financial_modeling_ref, String.t(), enforce: false
    field :gtm_strategy, String.t(), enforce: false, default: "Dont go to market"
    field :positioning, String.t(), enforce: false
    field :pre_post_mortem, String.t(), enforce: false
    field :benefits, %{ primary: nil, performance: nil, ux_improvement: nil, other: nil }, enforce: true
    field :addressable_market_size, %{ estimated_size: nil, method_of_estimation: nil, sources: nil }, enforce: false
    field :comments, %{ date_time:{commenter:<>, comment:<>, edited:<>}}, enforce: false
    # Lookups
    field :product_phase, String.t(), enforce: true
    field :type, String.t(), enforce: true
    field :prevalent_users, String.t(), enforce: false
    field :red_flags, String.t(), enforce: false
    field :anticipated_challenges, String.t(), enforce: false
    field :investment_type, String.t(), enforce: false
    # defaulted by the db
    field :date_created, DateTime.t(), enforce: false
    field :date_modified, DateTime.t(), enforce: false
    field :id, non_neg_integer(), enforce: false
    # fields from session (never passed by user, api) --
    field :customer_id, non_neg_integer(), enforce: true, default: "1"
    field :created_by, non_neg_integer(), enforce: true, default: "123"
    field :modified_by, non_neg_integer(), enforce: false
  end


  # Filters: Are kept at a high-granularity level and are supposed to be simple. The BL modules can do the more
  # complicated matching, filtering, etc.
  #
  # All my products
  # All products (admin, super admin, privileged users)
  # My team's products
  # A product (by id, or name)
  # Created on/Last Modified on - date range
  #     begin: date (or inf), end: date (or inf), default => begin=today, end=today
  # Created by/Last Modified by - user name (both or one)
  def get_product({filters:filters}) do

  end

  # The following are private functions so no need to be too explicit in naming them
  defp get_by_id(id) do

  end

  # this is really string matching as most folks would not know exact names
  defp get_by_name(matcher) do

  end

  defp get_by_date_created(date_range) do

  end

  defp get_by_date_modified(date_range) do

  end

  defp get_by_creator(user_name) do

  end

  defp get_by_last_modifier(user_name) do

  end


  # Really get all my products
  defp get_mine() do

  end

  defp get_my_teams_products() do

  end


  # an admin or someone with elevated privildeg
  defp get_all_products() do

  end


end

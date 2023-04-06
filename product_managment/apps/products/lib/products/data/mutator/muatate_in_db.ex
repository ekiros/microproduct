defmodule Product.Data.Mutator.DB do

  @moduledoc """
  This module changes (updates, deletes) various fields in the Product Data Model. The changes are then
  persisted to the backing DB. However, Moab will also perists every transaction (or state change) in an
  external append-only DB.

  Notes:
   - [Not True] Moab never deletes a row of data but tombstones them. Tombstoned rows can be recovered by the
     admin (as long as the attempt is made within a configured time window).
     Instead use, an append only db
  """


end

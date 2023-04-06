defmodule Cachew do
  @moduledoc """
  The module `Cachew` provides an ability to store session data. This module uses the ConCache library to provide
  an in-memory caching (session persistance)
  """

  import ConCache

  def init do
    :ok
  end

  # Note: all of these requests run in the caller process, without going through
  # the started process.

  # inserts value or overwrites the old one
  def overwrite(key, value) do
    ConCache.put(:simple_cache, key, value)
  end

  # inserts value or returns {:error, :already_exists}
  def insert_new(key, value) do
    ConCache.insert_new(:simple_cache, key, value)
  end

  def get(key) do
    ConCache.get(:simple_cache, key)
  end

  def remove(key) do
    ConCache.delete(:simple_cache, key)
  end

  # This function is isolated on a row level. Modifications such as update, put, delete,
  # on this key will wait for this function to finish. Modifications on other items are not affected.
  # Reads are always dirty.
  def update(key) do
    ConCache.update(:simple_cache, key, fn(old_value) ->
      # do stuff
      {:ok, new_value}
    end)
  end

  # Similar to update, but executes provided function only if item exists.
  # Otherwise returns {:error, :not_existing}
  def update_existing(key) do

    ConCache.update_existing(:simple_cache, key, fn(old_value) ->
      # do smthg
      {:ok, new_value}
    end)
  end

  # utility
  def cache_size() do
    ConCache.size(:simple_cache)
  end

end

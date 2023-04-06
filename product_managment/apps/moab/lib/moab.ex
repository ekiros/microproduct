defmodule Moab.Server do
  @moduledoc """
  The `Moab`app is the doorway to the entire Production Managment application
  """

  use GenServer

  require Logger

  #################
  ## Client API ##

  @doc """
  Start the Moab application server
  """
  def start_link(opts \\ []) do
    GenServer.start_link(__MODULE__, :ok, opts)
  end

  def stop(pid) do
    IO.puts """
    Moab: stop() moab...
    """

    GenServer.stop(pid, :normal)
  end

  @doc """
  The User services authenticate and authorize a given user. These User services will also create the proper
  web session data. Afterwards the Moab services (Product Managment modules & Processes) take over and can remove
  the session data. Once removed the given user (API, human, etc) will need to re-auth
  """
  def new_user_session(server, authenticated_user) do
    GenServer.call(server, {:create_user_session, authenticated_user})
  end

  @doc """
  The User has entry in the session cache but may have no session data yet (nil). If the
  session data is empyt, this call updates it to the given session data. If the session data
  is not nil, then this call appends to the existing data: Enum.join(old, new, ",")
  """
  def add_user_session_data(server, authenticated_user, session_data) do
    GenServer.call(server, {:add_session_data, authenticated_user, session_data})
  end

  @doc """
  Replaces existing session data with the new data
  """
  def update_user_session_data(server, authenticated_user, session_data) do
    GenServer.call(server, {:update_session_data, authenticated_user, session_data})
  end

  @doc """
  If there is a session data for the logged in user, return that data.
  """
  def user_session_data(server, authenticated_user) do
    GenServer.call(server, {:get_session, authenticated_user})
  end

  @doc """
  Prints the content of the session data object
  """
  def inspect_session(server) do
    GenServer.call(server, {:inspect_session})
  end

  @doc """
  remove all session data for an authenticated user.
  """
  def remove_user_sesssion(server, authenticated_user) do
    GenServer.cast(server, {:remove_session, authenticated_user})
  end

  ###############################################################
  ## GenServer Callbacks ###

  @impl true
  def init(:ok) do
    IO.puts """
    Moab: init() called...
    """

    {:ok, %{}}
  end

  # termination is handled by the sup

  @impl true
  def handle_call({:get_session, authenticated_user}, _from, sessions) do

    Logger.info("Moab: get_session() called with user #{authenticated_user}")

    {:reply, Map.fetch(sessions, authenticated_user), sessions}
    # returns :error on failure
  end

  @impl true
  def handle_call({:add_session_data, authenticated_user, session_data}, _from, sessions) do
    # 1 has the session even been started? is the cache empty
    # 2 if the cache is not empty, then is the value for the user session nil
    # 3 if the value is not nil, then append to existing value (separate by comma)
    case Map.fetch(sessions, authenticated_user) do
      :error ->
        Logger.info("Moab: add_session_data() - no session data (:error) for user #{authenticated_user}")
        sessions = Map.put(sessions, authenticated_user, session_data)
        {:reply, session_data, sessions}
      {:ok, nil} ->
        Logger.info("Moab: add_session_data() - nil session data for user #{authenticated_user} - adding #{session_data}")
        sessions = Map.put(sessions, authenticated_user, session_data)
        {:reply, session_data, sessions}
      {:ok, curr_session_data} ->
        Logger.info("Moab: add_session_data() - found session data. Appending #{session_data} to #{curr_session_data}")
        new_session = curr_session_data <> ";" <> session_data
        sessions = Map.put(sessions, authenticated_user, new_session)
        {:reply, session_data, sessions}
      _ ->
        Logger.info("Moab: add_session_data() - nothing to do for user #{authenticated_user}")
        {:reply, session_data, sessions}
    end
  end

  @impl true
  def handle_call({:update_session_data, authenticated_user, session_data}, _from, sessions) do
    {old_val, updated_session} =
      Map.get_and_update(sessions, authenticated_user,
        fn current_value -> { current_value, session_data }
      end)
    {:reply, old_val, updated_session}
  end

  @impl true
  def handle_call({:create_user_session, authenticated_user},  _from, sessions) do
    if Map.has_key?(sessions, authenticated_user) do
      {:reply, authenticated_user, sessions}
    else
      if is_nil(sessions) do
        sessions = %{}
      end
      Logger.info("Moab: create_user_session callback added a new user in session with no session data")

      sessions = Map.put(sessions, authenticated_user, nil)
      {:reply, authenticated_user, sessions}
    end
  end

  @impl true
  def handle_call({:inspect_session}, _from, sessions) do
    {:reply, IO.inspect(sessions), sessions}
  end

  @impl true
  def handle_cast({:remove_session, authenticated_user}, sessions) do
    sessions = Map.delete(sessions, authenticated_user)
    {:noreply, sessions}
  end

  @impl true
  def handle_info(_msg, state) do
    IO.puts """
    Moab: handle_info() called...
    """
    {:noreply, state}
  end

end

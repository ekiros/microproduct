defmodule MoabTest do
  use ExUnit.Case, async: true

  # doctest Moab.Server
  @userid1 "UUID-234"
  @userid2 "UUID-456"

  describe "Moab tests for session handling" do

    setup do
      pi = start_supervised!(Moab.Server)
      %{pid: pi}
    end

    test "session bucket creation, add key, and value test", %{pid: pi} do
      #IO.puts """
      #MoabTest: --->> started supervstor: #{pi}
      #"""

      assert Moab.Server.user_session_data(pi, @userid1) == :error

      Moab.Server.new_user_session(pi, @userid1)

      # just added user into session cache - but should have no session data yet
      assert  {:ok, nil} = Moab.Server.user_session_data(pi, @userid1)

      # Add session data to user1
      IO.puts """
      MoabTest: --->> Adding session data for existing user with no previous session data
      """

      # add_user_session_data(server, authenticated_user, session_data)
      Moab.Server.add_user_session_data(pi,@userid1,"session_data_1")

      assert Moab.Server.user_session_data(pi, @userid1) == {:ok, "session_data_1"}

      # Test with second user data
      IO.puts """
      MoabTest: --->> started test with second user data
      """

      Moab.Server.new_user_session(pi, @userid2)

      # just added user into session cache - but should have no session data yet
      assert  {:ok, nil} = Moab.Server.user_session_data(pi, @userid2)

      # add_user_session_data(server, authenticated_user, session_data)
      Moab.Server.add_user_session_data(pi,@userid2,"session_data_2")

      assert Moab.Server.user_session_data(pi, @userid2) == {:ok, "session_data_2"}

      # Add session data to user1
      IO.puts """
      MoabTest: --->> Adding session data for existing user with exiting session data
      """

      # add_user_session_data(server, authenticated_user, session_data)
      Moab.Server.add_user_session_data(pi,@userid1,"session_data_1_2")

      assert Moab.Server.user_session_data(pi, @userid1) == {:ok, "session_data_1;session_data_1_2"}

      # Remove first user session
      IO.puts """
      MoabTest: --->> Removing first user session and running test
      """

      #Moab.Server.remove_user_sesssion(pi, @userid1)

      #assert Moab.Server.user_session_data(pi, @userid1) == :error

      # Add session data to user1
      IO.puts """
      MoabTest: --->> Update session data (reset)
      """

      # Inspect session object
      IO.puts """
      MoabTest: --->> print out the entire currrent session
      """
      Moab.Server.inspect_session(pi)

    end
  end
end

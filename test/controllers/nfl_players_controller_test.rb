require 'test_helper'

class NflPlayersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @nfl_player = nfl_players(:one)
  end

  test "should get index" do
    get nfl_players_url
    assert_response :success
  end

  test "should get new" do
    get new_nfl_player_url
    assert_response :success
  end

  test "should create nfl_player" do
    assert_difference('NflPlayer.count') do
      post nfl_players_url, params: { nfl_player: { active: @nfl_player.active, college: @nfl_player.college, display_name: @nfl_player.display_name, dob: @nfl_player.dob, ffn_id: @nfl_player.ffn_id, fname: @nfl_player.fname, height: @nfl_player.height, jersey: @nfl_player.jersey, lname: @nfl_player.lname, postition: @nfl_player.postition, team: @nfl_player.team, weight: @nfl_player.weight } }
    end

    assert_redirected_to nfl_player_url(NflPlayer.last)
  end

  test "should show nfl_player" do
    get nfl_player_url(@nfl_player)
    assert_response :success
  end

  test "should get edit" do
    get edit_nfl_player_url(@nfl_player)
    assert_response :success
  end

  test "should update nfl_player" do
    patch nfl_player_url(@nfl_player), params: { nfl_player: { active: @nfl_player.active, college: @nfl_player.college, display_name: @nfl_player.display_name, dob: @nfl_player.dob, ffn_id: @nfl_player.ffn_id, fname: @nfl_player.fname, height: @nfl_player.height, jersey: @nfl_player.jersey, lname: @nfl_player.lname, postition: @nfl_player.postition, team: @nfl_player.team, weight: @nfl_player.weight } }
    assert_redirected_to nfl_player_url(@nfl_player)
  end

  test "should destroy nfl_player" do
    assert_difference('NflPlayer.count', -1) do
      delete nfl_player_url(@nfl_player)
    end

    assert_redirected_to nfl_players_url
  end
end

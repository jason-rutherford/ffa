require 'test_helper'

class NflTeamsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @nfl_team = nfl_teams(:one)
  end

  test "should get index" do
    get nfl_teams_url
    assert_response :success
  end

  test "should get new" do
    get new_nfl_team_url
    assert_response :success
  end

  test "should create nfl_team" do
    assert_difference('NflTeam.count') do
      post nfl_teams_url, params: { nfl_team: { code: @nfl_team.code, full_name: @nfl_team.full_name, short_name: @nfl_team.short_name } }
    end

    assert_redirected_to nfl_team_url(NflTeam.last)
  end

  test "should show nfl_team" do
    get nfl_team_url(@nfl_team)
    assert_response :success
  end

  test "should get edit" do
    get edit_nfl_team_url(@nfl_team)
    assert_response :success
  end

  test "should update nfl_team" do
    patch nfl_team_url(@nfl_team), params: { nfl_team: { code: @nfl_team.code, full_name: @nfl_team.full_name, short_name: @nfl_team.short_name } }
    assert_redirected_to nfl_team_url(@nfl_team)
  end

  test "should destroy nfl_team" do
    assert_difference('NflTeam.count', -1) do
      delete nfl_team_url(@nfl_team)
    end

    assert_redirected_to nfl_teams_url
  end
end

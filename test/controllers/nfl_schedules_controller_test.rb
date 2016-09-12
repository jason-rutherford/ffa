require 'test_helper'

class NflSchedulesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @nfl_schedule = nfl_schedules(:one)
  end

  test "should get index" do
    get nfl_schedules_url
    assert_response :success
  end

  test "should get new" do
    get new_nfl_schedule_url
    assert_response :success
  end

  test "should create nfl_schedule" do
    assert_difference('NflSchedule.count') do
      post nfl_schedules_url, params: { nfl_schedule: { away_team: @nfl_schedule.away_team, game_date: @nfl_schedule.game_date, game_time_et: @nfl_schedule.game_time_et, game_week: @nfl_schedule.game_week, home_team: @nfl_schedule.home_team, tv_station: @nfl_schedule.tv_station } }
    end

    assert_redirected_to nfl_schedule_url(NflSchedule.last)
  end

  test "should show nfl_schedule" do
    get nfl_schedule_url(@nfl_schedule)
    assert_response :success
  end

  test "should get edit" do
    get edit_nfl_schedule_url(@nfl_schedule)
    assert_response :success
  end

  test "should update nfl_schedule" do
    patch nfl_schedule_url(@nfl_schedule), params: { nfl_schedule: { away_team: @nfl_schedule.away_team, game_date: @nfl_schedule.game_date, game_time_et: @nfl_schedule.game_time_et, game_week: @nfl_schedule.game_week, home_team: @nfl_schedule.home_team, tv_station: @nfl_schedule.tv_station } }
    assert_redirected_to nfl_schedule_url(@nfl_schedule)
  end

  test "should destroy nfl_schedule" do
    assert_difference('NflSchedule.count', -1) do
      delete nfl_schedule_url(@nfl_schedule)
    end

    assert_redirected_to nfl_schedules_url
  end
end

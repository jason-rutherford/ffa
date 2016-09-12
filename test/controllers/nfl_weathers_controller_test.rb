require 'test_helper'

class NflWeathersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @nfl_weather = nfl_weathers(:one)
  end

  test "should get index" do
    get nfl_weathers_url
    assert_response :success
  end

  test "should get new" do
    get new_nfl_weather_url
    assert_response :success
  end

  test "should create nfl_weather" do
    assert_difference('NflWeather.count') do
      post nfl_weathers_url, params: { nfl_weather: { away_team: @nfl_weather.away_team, dome_img: @nfl_weather.dome_img, forcast: @nfl_weather.forcast, game_date: @nfl_weather.game_date, game_week: @nfl_weather.game_week, geo_lat: @nfl_weather.geo_lat, geo_long: @nfl_weather.geo_long, high: @nfl_weather.high, home_team: @nfl_weather.home_team, is_dome: @nfl_weather.is_dome, large_img: @nfl_weather.large_img, low: @nfl_weather.low, medium_img: @nfl_weather.medium_img, small_img: @nfl_weather.small_img, stadium: @nfl_weather.stadium, wind_chill: @nfl_weather.wind_chill, wind_speed: @nfl_weather.wind_speed } }
    end

    assert_redirected_to nfl_weather_url(NflWeather.last)
  end

  test "should show nfl_weather" do
    get nfl_weather_url(@nfl_weather)
    assert_response :success
  end

  test "should get edit" do
    get edit_nfl_weather_url(@nfl_weather)
    assert_response :success
  end

  test "should update nfl_weather" do
    patch nfl_weather_url(@nfl_weather), params: { nfl_weather: { away_team: @nfl_weather.away_team, dome_img: @nfl_weather.dome_img, forcast: @nfl_weather.forcast, game_date: @nfl_weather.game_date, game_week: @nfl_weather.game_week, geo_lat: @nfl_weather.geo_lat, geo_long: @nfl_weather.geo_long, high: @nfl_weather.high, home_team: @nfl_weather.home_team, is_dome: @nfl_weather.is_dome, large_img: @nfl_weather.large_img, low: @nfl_weather.low, medium_img: @nfl_weather.medium_img, small_img: @nfl_weather.small_img, stadium: @nfl_weather.stadium, wind_chill: @nfl_weather.wind_chill, wind_speed: @nfl_weather.wind_speed } }
    assert_redirected_to nfl_weather_url(@nfl_weather)
  end

  test "should destroy nfl_weather" do
    assert_difference('NflWeather.count', -1) do
      delete nfl_weather_url(@nfl_weather)
    end

    assert_redirected_to nfl_weathers_url
  end
end

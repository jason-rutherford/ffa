require 'test_helper'

class NflByesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @nfl_bye = nfl_byes(:one)
  end

  test "should get index" do
    get nfl_byes_url
    assert_response :success
  end

  test "should get new" do
    get new_nfl_bye_url
    assert_response :success
  end

  test "should create nfl_bye" do
    assert_difference('NflBye.count') do
      post nfl_byes_url, params: { nfl_bye: { bye_week: @nfl_bye.bye_week, display_name: @nfl_bye.display_name, team: @nfl_bye.team } }
    end

    assert_redirected_to nfl_bye_url(NflBye.last)
  end

  test "should show nfl_bye" do
    get nfl_bye_url(@nfl_bye)
    assert_response :success
  end

  test "should get edit" do
    get edit_nfl_bye_url(@nfl_bye)
    assert_response :success
  end

  test "should update nfl_bye" do
    patch nfl_bye_url(@nfl_bye), params: { nfl_bye: { bye_week: @nfl_bye.bye_week, display_name: @nfl_bye.display_name, team: @nfl_bye.team } }
    assert_redirected_to nfl_bye_url(@nfl_bye)
  end

  test "should destroy nfl_bye" do
    assert_difference('NflBye.count', -1) do
      delete nfl_bye_url(@nfl_bye)
    end

    assert_redirected_to nfl_byes_url
  end
end

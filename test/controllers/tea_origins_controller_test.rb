require "test_helper"

class TeaOriginsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tea_origin = tea_origins(:one)
  end

  test "should get index" do
    get tea_origins_url
    assert_response :success
  end

  test "should get new" do
    get new_tea_origin_url
    assert_response :success
  end

  test "should create tea_origin" do
    assert_difference("TeaOrigin.count") do
      post tea_origins_url, params: { tea_origin: { harvested_on: @tea_origin.harvested_on, latitude: @tea_origin.latitude, location_name: @tea_origin.location_name, longitude: @tea_origin.longitude, lot_id: @tea_origin.lot_id, name: @tea_origin.name, notes: @tea_origin.notes } }
    end

    assert_redirected_to tea_origin_url(TeaOrigin.last)
  end

  test "should show tea_origin" do
    get tea_origin_url(@tea_origin)
    assert_response :success
  end

  test "should get edit" do
    get edit_tea_origin_url(@tea_origin)
    assert_response :success
  end

  test "should update tea_origin" do
    patch tea_origin_url(@tea_origin), params: { tea_origin: { harvested_on: @tea_origin.harvested_on, latitude: @tea_origin.latitude, location_name: @tea_origin.location_name, longitude: @tea_origin.longitude, lot_id: @tea_origin.lot_id, name: @tea_origin.name, notes: @tea_origin.notes } }
    assert_redirected_to tea_origin_url(@tea_origin)
  end

  test "should destroy tea_origin" do
    assert_difference("TeaOrigin.count", -1) do
      delete tea_origin_url(@tea_origin)
    end

    assert_redirected_to tea_origins_url
  end
end

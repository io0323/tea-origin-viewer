require "application_system_test_case"

class TeaOriginsTest < ApplicationSystemTestCase
  setup do
    @tea_origin = tea_origins(:one)
  end

  test "visiting the index" do
    visit tea_origins_url
    assert_selector "h1", text: "Tea origins"
  end

  test "should create tea origin" do
    visit tea_origins_url
    click_on "New tea origin"

    fill_in "Harvested on", with: @tea_origin.harvested_on
    fill_in "Latitude", with: @tea_origin.latitude
    fill_in "Location name", with: @tea_origin.location_name
    fill_in "Longitude", with: @tea_origin.longitude
    fill_in "Lot", with: @tea_origin.lot_id
    fill_in "Name", with: @tea_origin.name
    fill_in "Notes", with: @tea_origin.notes
    click_on "Create Tea origin"

    assert_text "Tea origin was successfully created"
    click_on "Back"
  end

  test "should update Tea origin" do
    visit tea_origin_url(@tea_origin)
    click_on "Edit this tea origin", match: :first

    fill_in "Harvested on", with: @tea_origin.harvested_on
    fill_in "Latitude", with: @tea_origin.latitude
    fill_in "Location name", with: @tea_origin.location_name
    fill_in "Longitude", with: @tea_origin.longitude
    fill_in "Lot", with: @tea_origin.lot_id
    fill_in "Name", with: @tea_origin.name
    fill_in "Notes", with: @tea_origin.notes
    click_on "Update Tea origin"

    assert_text "Tea origin was successfully updated"
    click_on "Back"
  end

  test "should destroy Tea origin" do
    visit tea_origin_url(@tea_origin)
    click_on "Destroy this tea origin", match: :first

    assert_text "Tea origin was successfully destroyed"
  end
end

require "application_system_test_case"

class SeniorsTest < ApplicationSystemTestCase
  setup do
    @senior = seniors(:one)
  end

  test "visiting the index" do
    visit seniors_url
    assert_selector "h1", text: "Seniors"
  end

  test "creating a Senior" do
    visit seniors_url
    click_on "New Senior"

    click_on "Create Senior"

    assert_text "Senior was successfully created"
    click_on "Back"
  end

  test "updating a Senior" do
    visit seniors_url
    click_on "Edit", match: :first

    click_on "Update Senior"

    assert_text "Senior was successfully updated"
    click_on "Back"
  end

  test "destroying a Senior" do
    visit seniors_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Senior was successfully destroyed"
  end
end

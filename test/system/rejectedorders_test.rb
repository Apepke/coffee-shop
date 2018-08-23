require "application_system_test_case"

class RejectedordersTest < ApplicationSystemTestCase
  setup do
    @rejectedorder = rejectedorders(:one)
  end

  test "visiting the index" do
    visit rejectedorders_url
    assert_selector "h1", text: "Rejectedorders"
  end

  test "creating a Rejectedorder" do
    visit rejectedorders_url
    click_on "New Rejectedorder"

    fill_in "Comment", with: @rejectedorder.comment
    fill_in "Rejected Order", with: @rejectedorder.rejected-order
    click_on "Create Rejectedorder"

    assert_text "Rejectedorder was successfully created"
    click_on "Back"
  end

  test "updating a Rejectedorder" do
    visit rejectedorders_url
    click_on "Edit", match: :first

    fill_in "Comment", with: @rejectedorder.comment
    fill_in "Rejected Order", with: @rejectedorder.rejected-order
    click_on "Update Rejectedorder"

    assert_text "Rejectedorder was successfully updated"
    click_on "Back"
  end

  test "destroying a Rejectedorder" do
    visit rejectedorders_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Rejectedorder was successfully destroyed"
  end
end

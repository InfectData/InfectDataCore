require "application_system_test_case"

class CasesTest < ApplicationSystemTestCase
  setup do
    @case = cases(:one)
  end

  test "visiting the index" do
    visit cases_url
    assert_selector "h1", text: "Cases"
  end

  test "creating a Case" do
    visit cases_url
    click_on "New Case"

    fill_in "Birthdate", with: @case.birthdate
    fill_in "Confirmed at", with: @case.confirmed_at
    fill_in "Diagnosis", with: @case.diagnosis
    fill_in "First name", with: @case.first_name
    fill_in "Gender", with: @case.gender
    fill_in "Last name", with: @case.last_name
    fill_in "Place of residence", with: @case.place_of_residence
    fill_in "User", with: @case.user_id
    click_on "Create Case"

    assert_text "Case was successfully created"
    click_on "Back"
  end

  test "updating a Case" do
    visit cases_url
    click_on "Edit", match: :first

    fill_in "Birthdate", with: @case.birthdate
    fill_in "Confirmed at", with: @case.confirmed_at
    fill_in "Diagnosis", with: @case.diagnosis
    fill_in "First name", with: @case.first_name
    fill_in "Gender", with: @case.gender
    fill_in "Last name", with: @case.last_name
    fill_in "Place of residence", with: @case.place_of_residence
    fill_in "User", with: @case.user_id
    click_on "Update Case"

    assert_text "Case was successfully updated"
    click_on "Back"
  end

  test "destroying a Case" do
    visit cases_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Case was successfully destroyed"
  end
end

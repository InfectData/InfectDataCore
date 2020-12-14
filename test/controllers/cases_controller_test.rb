require 'test_helper'

class CasesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @case = cases(:one)
  end

  test "should get index" do
    get cases_url
    assert_response :success
  end

  test "should get new" do
    get new_case_url
    assert_response :success
  end

  test "should create case" do
    assert_difference('Case.count') do
      post cases_url, params: { case: { birthdate: @case.birthdate, confirmed_at: @case.confirmed_at, diagnosis: @case.diagnosis, first_name: @case.first_name, gender: @case.gender, last_name: @case.last_name, place_of_residence: @case.place_of_residence, user_id: @case.user_id } }
    end

    assert_redirected_to case_url(Case.last)
  end

  test "should show case" do
    get case_url(@case)
    assert_response :success
  end

  test "should get edit" do
    get edit_case_url(@case)
    assert_response :success
  end

  test "should update case" do
    patch case_url(@case), params: { case: { birthdate: @case.birthdate, confirmed_at: @case.confirmed_at, diagnosis: @case.diagnosis, first_name: @case.first_name, gender: @case.gender, last_name: @case.last_name, place_of_residence: @case.place_of_residence, user_id: @case.user_id } }
    assert_redirected_to case_url(@case)
  end

  test "should destroy case" do
    assert_difference('Case.count', -1) do
      delete case_url(@case)
    end

    assert_redirected_to cases_url
  end
end

require 'test_helper'

class ReportControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get report_new_url
    assert_response :success
  end

  test "should get index" do
    get report_index_url
    assert_response :success
  end

end

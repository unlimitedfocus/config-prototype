require 'test_helper'

class EnvironmentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get environments_index_url
    assert_response :success
  end

end

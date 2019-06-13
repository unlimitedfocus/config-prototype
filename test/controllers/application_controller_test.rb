require 'test_helper'

class ApplicationControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    sign_in FactoryBot.create(:user)
  end

  test "should get index" do
    get root_path
    assert_response :success
  end

end

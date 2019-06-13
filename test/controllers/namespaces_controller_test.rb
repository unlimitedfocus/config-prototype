require 'test_helper'

class NamespacesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    sign_in FactoryBot.create(:user)
    @namespace = FactoryBot.create(:namespace)
  end

  test "should get index" do
    get namespaces_url
    assert_response :success
  end

  test "should get new" do
    get new_namespace_url
    assert_response :success
  end

  # FIXME: use factory_bot
  test "should create namespace" do
    assert_difference('Namespace.count') do
      @new_namespace = FactoryBot.build(:namespace)
      post namespaces_url, params: { namespace: { application: @new_namespace.application, deleted_at: @new_namespace.deleted_at, environment: @new_namespace.environment, team: @new_namespace.team } }
    end

    assert_redirected_to namespace_url(Namespace.last)
  end

  test "should show namespace" do
    get namespace_url(@namespace)
    assert_response :success
  end

  test "should get edit" do
    get edit_namespace_url(@namespace)
    assert_response :success
  end

  test "should update namespace" do
    patch namespace_url(@namespace), params: { namespace: { application: @namespace.application, deleted_at: @namespace.deleted_at, environment: @namespace.environment, team: @namespace.team } }
    assert_redirected_to namespace_url(@namespace)
  end

  test "should destroy namespace" do
    assert_difference('Namespace.count', -1) do
      delete namespace_url(@namespace)
    end

    assert_redirected_to namespaces_url
  end
end

require "application_system_test_case"

class NamespacesTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  def setup
    sign_in FactoryBot.create(:user)
    @namespace = FactoryBot.create(:namespace)
  end

  test "visiting the index" do
    visit namespaces_url
    assert_selector "h1", text: "Namespaces"
  end

  test "creating a Namespace" do
      @new_namespace = FactoryBot.build(:namespace)
    visit namespaces_url
    click_on "New Namespace"

    fill_in "Application", with: @new_namespace.application
    fill_in "Environment", with: @new_namespace.environment
    fill_in "Team", with: @new_namespace.team
    click_on "Create Namespace"

    assert_text "Namespace was successfully created"
    click_on "Back"
  end

  test "updating a Namespace" do
    visit namespaces_url
    click_on "Edit", match: :first

    fill_in "Application", with: @namespace.application
    fill_in "Environment", with: @namespace.environment
    fill_in "Team", with: @namespace.team
    click_on "Update Namespace"

    assert_text "Namespace was successfully updated"
    click_on "Back"
  end

  test "destroying a Namespace" do
    visit namespaces_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Namespace was successfully destroyed"
  end
end

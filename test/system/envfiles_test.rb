require "application_system_test_case"

class EnvfilesTest < ApplicationSystemTestCase
  setup do
    @envfile = envfiles(:one)
  end

  test "visiting the index" do
    visit envfiles_url
    assert_selector "h1", text: "Envfiles"
  end

  test "creating a Envfile" do
    visit envfiles_url
    click_on "New Envfile"

    # fill_in "Deleted at", with: @envfile.deleted_at
    fill_in "Filename", with: @envfile.filename
    fill_in "Filetype", with: @envfile.filetype
    fill_in "Namespace", with: @envfile.namespace_id
    click_on "Create Envfile"

    assert_text "Envfile was successfully created"
    click_on "Back"
  end

  test "updating a Envfile" do
    visit envfiles_url
    click_on "Edit", match: :first

    # fill_in "Deleted at", with: @envfile.deleted_at
    fill_in "Filename", with: @envfile.filename
    fill_in "Filetype", with: @envfile.filetype
    fill_in "Namespace", with: @envfile.namespace_id
    click_on "Update Envfile"

    assert_text "Envfile was successfully updated"
    click_on "Back"
  end

  test "destroying a Envfile" do
    visit envfiles_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Envfile was successfully destroyed"
  end
end

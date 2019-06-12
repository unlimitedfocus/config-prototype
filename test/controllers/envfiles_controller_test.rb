require 'test_helper'

class EnvfilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @envfile = envfiles(:one)
  end

  test "should get index" do
    get envfiles_url
    assert_response :success
  end

  test "should get new" do
    get new_envfile_url
    assert_response :success
  end

  test "should create envfile" do
    assert_difference('Envfile.count') do
      post envfiles_url, params: { envfile: { deleted_at: @envfile.deleted_at, filename: @envfile.filename, filetype: @envfile.filetype, namespace_id: @envfile.namespace_id } }
    end

    assert_redirected_to envfile_url(Envfile.last)
  end

  test "should show envfile" do
    get envfile_url(@envfile)
    assert_response :success
  end

  test "should get edit" do
    get edit_envfile_url(@envfile)
    assert_response :success
  end

  test "should update envfile" do
    patch envfile_url(@envfile), params: { envfile: { deleted_at: @envfile.deleted_at, filename: @envfile.filename, filetype: @envfile.filetype, namespace_id: @envfile.namespace_id } }
    assert_redirected_to envfile_url(@envfile)
  end

  test "should destroy envfile" do
    assert_difference('Envfile.count', -1) do
      delete envfile_url(@envfile)
    end

    assert_redirected_to envfiles_url
  end
end

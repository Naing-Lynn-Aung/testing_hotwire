require "test_helper"

class ProjectControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get project_index_url
    assert_response :success
  end

  test "should get create" do
    get project_create_url
    assert_response :success
  end

  test "should get update" do
    get project_update_url
    assert_response :success
  end

  test "should get destroy" do
    get project_destroy_url
    assert_response :success
  end
end

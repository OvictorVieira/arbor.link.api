require "test_helper"

class Api::V1::EntitiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_entities_index_url
    assert_response :success
  end

  test "should get show" do
    get api_v1_entities_show_url
    assert_response :success
  end

  test "should get new" do
    get api_v1_entities_new_url
    assert_response :success
  end

  test "should get edit" do
    get api_v1_entities_edit_url
    assert_response :success
  end

  test "should get create" do
    get api_v1_entities_create_url
    assert_response :success
  end

  test "should get update" do
    get api_v1_entities_update_url
    assert_response :success
  end

  test "should get destroy" do
    get api_v1_entities_destroy_url
    assert_response :success
  end
end

require 'test_helper'

class SearchRequestsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get search_requests_index_url
    assert_response :success
  end

  test "should get show" do
    get search_requests_show_url
    assert_response :success
  end

  test "should get new" do
    get search_requests_new_url
    assert_response :success
  end

  test "should get create" do
    get search_requests_create_url
    assert_response :success
  end

  test "should get delete" do
    get search_requests_delete_url
    assert_response :success
  end

end

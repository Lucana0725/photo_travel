require "test_helper"

class Public::TravelsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_travels_new_url
    assert_response :success
  end

  test "should get create" do
    get public_travels_create_url
    assert_response :success
  end

  test "should get index" do
    get public_travels_index_url
    assert_response :success
  end

  test "should get show" do
    get public_travels_show_url
    assert_response :success
  end

  test "should get destroy" do
    get public_travels_destroy_url
    assert_response :success
  end
end

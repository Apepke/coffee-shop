require 'test_helper'

class RejectedordersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rejectedorder = rejectedorders(:one)
  end

  test "should get index" do
    get rejectedorders_url
    assert_response :success
  end

  test "should get new" do
    get new_rejectedorder_url
    assert_response :success
  end

  test "should create rejectedorder" do
    assert_difference('Rejectedorder.count') do
      post rejectedorders_url, params: { rejectedorder: { comment: @rejectedorder.comment, rejected-order: @rejectedorder.rejected-order } }
    end

    assert_redirected_to rejectedorder_url(Rejectedorder.last)
  end

  test "should show rejectedorder" do
    get rejectedorder_url(@rejectedorder)
    assert_response :success
  end

  test "should get edit" do
    get edit_rejectedorder_url(@rejectedorder)
    assert_response :success
  end

  test "should update rejectedorder" do
    patch rejectedorder_url(@rejectedorder), params: { rejectedorder: { comment: @rejectedorder.comment, rejected-order: @rejectedorder.rejected-order } }
    assert_redirected_to rejectedorder_url(@rejectedorder)
  end

  test "should destroy rejectedorder" do
    assert_difference('Rejectedorder.count', -1) do
      delete rejectedorder_url(@rejectedorder)
    end

    assert_redirected_to rejectedorders_url
  end
end

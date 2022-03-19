require 'test_helper'

class InvestorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @investor = investors(:one)
  end

  test "should get index" do
    get investors_url
    assert_response :success
  end

  test "should get new" do
    get new_investor_url
    assert_response :success
  end

  test "should create investor" do
    assert_difference('Investor.count') do
      post investors_url, params: { investor: {  } }
    end

    assert_redirected_to investor_url(Investor.last)
  end

  test "should show investor" do
    get investor_url(@investor)
    assert_response :success
  end

  test "should get edit" do
    get edit_investor_url(@investor)
    assert_response :success
  end

  test "should update investor" do
    patch investor_url(@investor), params: { investor: {  } }
    assert_redirected_to investor_url(@investor)
  end

  test "should destroy investor" do
    assert_difference('Investor.count', -1) do
      delete investor_url(@investor)
    end

    assert_redirected_to investors_url
  end
end

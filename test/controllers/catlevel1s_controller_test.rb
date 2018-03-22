require 'test_helper'

class Catlevel1sControllerTest < ActionDispatch::IntegrationTest
  setup do
    @catlevel1 = catlevel1s(:one)
  end

  test "should get index" do
    get catlevel1s_url
    assert_response :success
  end

  test "should get new" do
    get new_catlevel1_url
    assert_response :success
  end

  test "should create catlevel1" do
    assert_difference('Catlevel1.count') do
      post catlevel1s_url, params: { catlevel1: { category_id: @catlevel1.category_id, info: @catlevel1.info, name: @catlevel1.name } }
    end

    assert_redirected_to catlevel1_url(Catlevel1.last)
  end

  test "should show catlevel1" do
    get catlevel1_url(@catlevel1)
    assert_response :success
  end

  test "should get edit" do
    get edit_catlevel1_url(@catlevel1)
    assert_response :success
  end

  test "should update catlevel1" do
    patch catlevel1_url(@catlevel1), params: { catlevel1: { category_id: @catlevel1.category_id, info: @catlevel1.info, name: @catlevel1.name } }
    assert_redirected_to catlevel1_url(@catlevel1)
  end

  test "should destroy catlevel1" do
    assert_difference('Catlevel1.count', -1) do
      delete catlevel1_url(@catlevel1)
    end

    assert_redirected_to catlevel1s_url
  end
end

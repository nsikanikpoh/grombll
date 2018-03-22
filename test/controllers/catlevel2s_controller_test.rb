require 'test_helper'

class Catlevel2sControllerTest < ActionDispatch::IntegrationTest
  setup do
    @catlevel2 = catlevel2s(:one)
  end

  test "should get index" do
    get catlevel2s_url
    assert_response :success
  end

  test "should get new" do
    get new_catlevel2_url
    assert_response :success
  end

  test "should create catlevel2" do
    assert_difference('Catlevel2.count') do
      post catlevel2s_url, params: { catlevel2: { category_id: @catlevel2.category_id, catlevel1_id: @catlevel2.catlevel1_id, info: @catlevel2.info, name: @catlevel2.name } }
    end

    assert_redirected_to catlevel2_url(Catlevel2.last)
  end

  test "should show catlevel2" do
    get catlevel2_url(@catlevel2)
    assert_response :success
  end

  test "should get edit" do
    get edit_catlevel2_url(@catlevel2)
    assert_response :success
  end

  test "should update catlevel2" do
    patch catlevel2_url(@catlevel2), params: { catlevel2: { category_id: @catlevel2.category_id, catlevel1_id: @catlevel2.catlevel1_id, info: @catlevel2.info, name: @catlevel2.name } }
    assert_redirected_to catlevel2_url(@catlevel2)
  end

  test "should destroy catlevel2" do
    assert_difference('Catlevel2.count', -1) do
      delete catlevel2_url(@catlevel2)
    end

    assert_redirected_to catlevel2s_url
  end
end

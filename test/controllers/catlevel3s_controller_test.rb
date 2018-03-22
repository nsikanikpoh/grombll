require 'test_helper'

class Catlevel3sControllerTest < ActionDispatch::IntegrationTest
  setup do
    @catlevel3 = catlevel3s(:one)
  end

  test "should get index" do
    get catlevel3s_url
    assert_response :success
  end

  test "should get new" do
    get new_catlevel3_url
    assert_response :success
  end

  test "should create catlevel3" do
    assert_difference('Catlevel3.count') do
      post catlevel3s_url, params: { catlevel3: { category_id: @catlevel3.category_id, catlevel1_id: @catlevel3.catlevel1_id, catlevel2_id: @catlevel3.catlevel2_id, info: @catlevel3.info, name: @catlevel3.name } }
    end

    assert_redirected_to catlevel3_url(Catlevel3.last)
  end

  test "should show catlevel3" do
    get catlevel3_url(@catlevel3)
    assert_response :success
  end

  test "should get edit" do
    get edit_catlevel3_url(@catlevel3)
    assert_response :success
  end

  test "should update catlevel3" do
    patch catlevel3_url(@catlevel3), params: { catlevel3: { category_id: @catlevel3.category_id, catlevel1_id: @catlevel3.catlevel1_id, catlevel2_id: @catlevel3.catlevel2_id, info: @catlevel3.info, name: @catlevel3.name } }
    assert_redirected_to catlevel3_url(@catlevel3)
  end

  test "should destroy catlevel3" do
    assert_difference('Catlevel3.count', -1) do
      delete catlevel3_url(@catlevel3)
    end

    assert_redirected_to catlevel3s_url
  end
end

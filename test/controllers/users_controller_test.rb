require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post users_url, params: { user: { address: @user.address, avarta: @user.avarta, category_id: @user.category_id, catlevel1_id: @user.catlevel1_id, catlevel2_id: @user.catlevel2_id, catlevel3_id: @user.catlevel3_id, city: @user.city, first_name: @user.first_name, info: @user.info, last_name: @user.last_name, phone: @user.phone, sex: @user.sex, state: @user.state, title: @user.title, type: @user.type } }
    end

    assert_redirected_to user_url(User.last)
  end

  test "should show user" do
    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    patch user_url(@user), params: { user: { address: @user.address, avarta: @user.avarta, category_id: @user.category_id, catlevel1_id: @user.catlevel1_id, catlevel2_id: @user.catlevel2_id, catlevel3_id: @user.catlevel3_id, city: @user.city, first_name: @user.first_name, info: @user.info, last_name: @user.last_name, phone: @user.phone, sex: @user.sex, state: @user.state, title: @user.title, type: @user.type } }
    assert_redirected_to user_url(@user)
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete user_url(@user)
    end

    assert_redirected_to users_url
  end
end

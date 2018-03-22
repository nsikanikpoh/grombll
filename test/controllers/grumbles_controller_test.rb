require 'test_helper'

class GrumblesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @grumble = grumbles(:one)
  end

  test "should get index" do
    get grumbles_url
    assert_response :success
  end

  test "should get new" do
    get new_grumble_url
    assert_response :success
  end

  test "should create grumble" do
    assert_difference('Grumble.count') do
      post grumbles_url, params: { grumble: { agency_id: @grumble.agency_id, category_id: @grumble.category_id, catlevel1_id: @grumble.catlevel1_id, catlevel2_id: @grumble.catlevel2_id, catlevel3_id: @grumble.catlevel3_id, city: @grumble.city, company_id: @grumble.company_id, company_name: @grumble.company_name, complain: @grumble.complain, date: @grumble.date, file: @grumble.file, grumbler_id: @grumble.grumbler_id, state: @grumble.state, status: @grumble.status } }
    end

    assert_redirected_to grumble_url(Grumble.last)
  end

  test "should show grumble" do
    get grumble_url(@grumble)
    assert_response :success
  end

  test "should get edit" do
    get edit_grumble_url(@grumble)
    assert_response :success
  end

  test "should update grumble" do
    patch grumble_url(@grumble), params: { grumble: { agency_id: @grumble.agency_id, category_id: @grumble.category_id, catlevel1_id: @grumble.catlevel1_id, catlevel2_id: @grumble.catlevel2_id, catlevel3_id: @grumble.catlevel3_id, city: @grumble.city, company_id: @grumble.company_id, company_name: @grumble.company_name, complain: @grumble.complain, date: @grumble.date, file: @grumble.file, grumbler_id: @grumble.grumbler_id, state: @grumble.state, status: @grumble.status } }
    assert_redirected_to grumble_url(@grumble)
  end

  test "should destroy grumble" do
    assert_difference('Grumble.count', -1) do
      delete grumble_url(@grumble)
    end

    assert_redirected_to grumbles_url
  end
end

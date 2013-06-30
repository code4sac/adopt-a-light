require 'test_helper'

class OwnersControllerTest < ActionController::TestCase
  setup do
    @owner = owners(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:owners)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create owner" do
    assert_difference('Owner.count') do
      post :create, owner: { address_1: @owner.address_1, address_2: @owner.address_2, city: @owner.city, email: @owner.email, name: @owner.name, orgainization: @owner.orgainization, sms_number: @owner.sms_number, state: @owner.state, voice_number: @owner.voice_number, zip: @owner.zip }
    end

    assert_redirected_to owner_path(assigns(:owner))
  end

  test "should show owner" do
    get :show, id: @owner
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @owner
    assert_response :success
  end

  test "should update owner" do
    put :update, id: @owner, owner: { address_1: @owner.address_1, address_2: @owner.address_2, city: @owner.city, email: @owner.email, name: @owner.name, orgainization: @owner.orgainization, sms_number: @owner.sms_number, state: @owner.state, voice_number: @owner.voice_number, zip: @owner.zip }
    assert_redirected_to owner_path(assigns(:owner))
  end

  test "should destroy owner" do
    assert_difference('Owner.count', -1) do
      delete :destroy, id: @owner
    end

    assert_redirected_to owners_path
  end
end

require 'test_helper'

class DelegationsControllerTest < ActionController::TestCase
  setup do
    @delegation = delegations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:delegations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create delegation" do
    assert_difference('Delegation.count') do
      post :create, delegation: { category_id: @delegation.category_id, delegee_id: @delegation.delegee_id, representative_id: @delegation.representative_id }
    end

    assert_redirected_to delegation_path(assigns(:delegation))
  end

  test "should show delegation" do
    get :show, id: @delegation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @delegation
    assert_response :success
  end

  test "should update delegation" do
    patch :update, id: @delegation, delegation: { category_id: @delegation.category_id, delegee_id: @delegation.delegee_id, representative_id: @delegation.representative_id }
    assert_redirected_to delegation_path(assigns(:delegation))
  end

  test "should destroy delegation" do
    assert_difference('Delegation.count', -1) do
      delete :destroy, id: @delegation
    end

    assert_redirected_to delegations_path
  end
end

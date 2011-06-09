require 'test_helper'

class RelatedsControllerTest < ActionController::TestCase
  setup do
    @related = relateds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:relateds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create related" do
    assert_difference('Related.count') do
      post :create, :related => @related.attributes
    end

    assert_redirected_to related_path(assigns(:related))
  end

  test "should show related" do
    get :show, :id => @related.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @related.to_param
    assert_response :success
  end

  test "should update related" do
    put :update, :id => @related.to_param, :related => @related.attributes
    assert_redirected_to related_path(assigns(:related))
  end

  test "should destroy related" do
    assert_difference('Related.count', -1) do
      delete :destroy, :id => @related.to_param
    end

    assert_redirected_to relateds_path
  end
end

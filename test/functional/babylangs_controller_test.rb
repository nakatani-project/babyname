require 'test_helper'

class BabylangsControllerTest < ActionController::TestCase
  setup do
    @babylang = babylangs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:babylangs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create babylang" do
    assert_difference('Babylang.count') do
      post :create, :babylang => @babylang.attributes
    end

    assert_redirected_to babylang_path(assigns(:babylang))
  end

  test "should show babylang" do
    get :show, :id => @babylang.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @babylang.to_param
    assert_response :success
  end

  test "should update babylang" do
    put :update, :id => @babylang.to_param, :babylang => @babylang.attributes
    assert_redirected_to babylang_path(assigns(:babylang))
  end

  test "should destroy babylang" do
    assert_difference('Babylang.count', -1) do
      delete :destroy, :id => @babylang.to_param
    end

    assert_redirected_to babylangs_path
  end
end

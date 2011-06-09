require 'test_helper'

class OriginlangsControllerTest < ActionController::TestCase
  setup do
    @originlang = originlangs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:originlangs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create originlang" do
    assert_difference('Originlang.count') do
      post :create, :originlang => @originlang.attributes
    end

    assert_redirected_to originlang_path(assigns(:originlang))
  end

  test "should show originlang" do
    get :show, :id => @originlang.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @originlang.to_param
    assert_response :success
  end

  test "should update originlang" do
    put :update, :id => @originlang.to_param, :originlang => @originlang.attributes
    assert_redirected_to originlang_path(assigns(:originlang))
  end

  test "should destroy originlang" do
    assert_difference('Originlang.count', -1) do
      delete :destroy, :id => @originlang.to_param
    end

    assert_redirected_to originlangs_path
  end
end

require 'test_helper'

class BabyregionsControllerTest < ActionController::TestCase
  setup do
    @babyregion = babyregions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:babyregions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create babyregion" do
    assert_difference('Babyregion.count') do
      post :create, :babyregion => @babyregion.attributes
    end

    assert_redirected_to babyregion_path(assigns(:babyregion))
  end

  test "should show babyregion" do
    get :show, :id => @babyregion.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @babyregion.to_param
    assert_response :success
  end

  test "should update babyregion" do
    put :update, :id => @babyregion.to_param, :babyregion => @babyregion.attributes
    assert_redirected_to babyregion_path(assigns(:babyregion))
  end

  test "should destroy babyregion" do
    assert_difference('Babyregion.count', -1) do
      delete :destroy, :id => @babyregion.to_param
    end

    assert_redirected_to babyregions_path
  end
end

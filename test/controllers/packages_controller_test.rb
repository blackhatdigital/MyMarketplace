require 'test_helper'

class PackagesControllerTest < ActionController::TestCase
  setup do
    @package = packages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:packages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create package" do
    assert_difference('Package.count') do
      post :create, package: { audience_size: @package.audience_size, description: @package.description, name: @package.name, price: @package.price, sample_required: @package.sample_required, target_id: @package.target_id, timeframe_days: @package.timeframe_days, user_id: @package.user_id }
    end

    assert_redirected_to package_path(assigns(:package))
  end

  test "should show package" do
    get :show, id: @package
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @package
    assert_response :success
  end

  test "should update package" do
    patch :update, id: @package, package: { audience_size: @package.audience_size, description: @package.description, name: @package.name, price: @package.price, sample_required: @package.sample_required, target_id: @package.target_id, timeframe_days: @package.timeframe_days, user_id: @package.user_id }
    assert_redirected_to package_path(assigns(:package))
  end

  test "should destroy package" do
    assert_difference('Package.count', -1) do
      delete :destroy, id: @package
    end

    assert_redirected_to packages_path
  end
end

require 'test_helper'

class MassmailsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:massmails)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create massmail" do
    assert_difference('Massmail.count') do
      post :create, :massmail => { }
    end

    assert_redirected_to massmail_path(assigns(:massmail))
  end

  test "should show massmail" do
    get :show, :id => massmails(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => massmails(:one).to_param
    assert_response :success
  end

  test "should update massmail" do
    put :update, :id => massmails(:one).to_param, :massmail => { }
    assert_redirected_to massmail_path(assigns(:massmail))
  end

  test "should destroy massmail" do
    assert_difference('Massmail.count', -1) do
      delete :destroy, :id => massmails(:one).to_param
    end

    assert_redirected_to massmails_path
  end
end

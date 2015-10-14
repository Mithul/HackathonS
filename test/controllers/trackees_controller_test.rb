require 'test_helper'

class TrackeesControllerTest < ActionController::TestCase
  setup do
    @trackee = trackees(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:trackees)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create trackee" do
    assert_difference('Trackee.count') do
      post :create, trackee: { flag: @trackee.flag, last_login: @trackee.last_login, login_count: @trackee.login_count, name: @trackee.name, track: @trackee.track, trackBrowser: @trackee.trackBrowser }
    end

    assert_redirected_to trackee_path(assigns(:trackee))
  end

  test "should show trackee" do
    get :show, id: @trackee
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @trackee
    assert_response :success
  end

  test "should update trackee" do
    patch :update, id: @trackee, trackee: { flag: @trackee.flag, last_login: @trackee.last_login, login_count: @trackee.login_count, name: @trackee.name, track: @trackee.track, trackBrowser: @trackee.trackBrowser }
    assert_redirected_to trackee_path(assigns(:trackee))
  end

  test "should destroy trackee" do
    assert_difference('Trackee.count', -1) do
      delete :destroy, id: @trackee
    end

    assert_redirected_to trackees_path
  end
end

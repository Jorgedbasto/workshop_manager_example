require 'test_helper'

class WorkshopsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:workshops)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create workshop" do
    assert_difference('Workshop.count') do
      post :create, :workshop => { }
    end

    assert_redirected_to workshop_path(assigns(:workshop))
  end

  test "should show workshop" do
    get :show, :id => workshops(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => workshops(:one).id
    assert_response :success
  end

  test "should update workshop" do
    put :update, :id => workshops(:one).id, :workshop => { }
    assert_redirected_to workshop_path(assigns(:workshop))
  end

  test "should destroy workshop" do
    assert_difference('Workshop.count', -1) do
      delete :destroy, :id => workshops(:one).id
    end

    assert_redirected_to workshops_path
  end
end

require 'test_helper'

class GamefishesControllerTest < ActionController::TestCase
  setup do
    @gamefish = gamefishes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gamefishes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gamefish" do
    assert_difference('Gamefish.count') do
      post :create, gamefish: {  }
    end

    assert_redirected_to gamefish_path(assigns(:gamefish))
  end

  test "should show gamefish" do
    get :show, id: @gamefish
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gamefish
    assert_response :success
  end

  test "should update gamefish" do
    patch :update, id: @gamefish, gamefish: {  }
    assert_redirected_to gamefish_path(assigns(:gamefish))
  end

  test "should destroy gamefish" do
    assert_difference('Gamefish.count', -1) do
      delete :destroy, id: @gamefish
    end

    assert_redirected_to gamefishes_path
  end
end

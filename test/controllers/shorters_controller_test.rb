require 'test_helper'

class ShortersControllerTest < ActionController::TestCase
  setup do
    @shorter = shorters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shorters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shorter" do
    assert_difference('Shorter.count') do
      post :create, shorter: { click: @shorter.click, long_url: @shorter.long_url, short_url: @shorter.short_url, user_id: @shorter.user_id }
    end

    assert_redirected_to shorter_path(assigns(:shorter))
  end

  test "should show shorter" do
    get :show, id: @shorter
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @shorter
    assert_response :success
  end

  test "should update shorter" do
    patch :update, id: @shorter, shorter: { click: @shorter.click, long_url: @shorter.long_url, short_url: @shorter.short_url, user_id: @shorter.user_id }
    assert_redirected_to shorter_path(assigns(:shorter))
  end

  test "should destroy shorter" do
    assert_difference('Shorter.count', -1) do
      delete :destroy, id: @shorter
    end

    assert_redirected_to shorters_path
  end
end

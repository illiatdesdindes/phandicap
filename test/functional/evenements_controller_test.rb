require 'test_helper'

class EvenementsControllerTest < ActionController::TestCase
  setup do
    @evenement = evenements(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:evenements)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create evenement" do
    assert_difference('Evenement.count') do
      post :create, :evenement => @evenement.attributes
    end

    assert_redirected_to evenement_path(assigns(:evenement))
  end

  test "should show evenement" do
    get :show, :id => @evenement.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @evenement.to_param
    assert_response :success
  end

  test "should update evenement" do
    put :update, :id => @evenement.to_param, :evenement => @evenement.attributes
    assert_redirected_to evenement_path(assigns(:evenement))
  end

  test "should destroy evenement" do
    assert_difference('Evenement.count', -1) do
      delete :destroy, :id => @evenement.to_param
    end

    assert_redirected_to evenements_path
  end
end

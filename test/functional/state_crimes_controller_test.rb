require 'test_helper'

class StateCrimesControllerTest < ActionController::TestCase
  setup do
    @state_crime = state_crimes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:state_crimes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create state_crime" do
    assert_difference('StateCrime.count') do
      post :create, state_crime: { count: @state_crime.count, year: @state_crime.year }
    end

    assert_redirected_to state_crime_path(assigns(:state_crime))
  end

  test "should show state_crime" do
    get :show, id: @state_crime
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @state_crime
    assert_response :success
  end

  test "should update state_crime" do
    put :update, id: @state_crime, state_crime: { count: @state_crime.count, year: @state_crime.year }
    assert_redirected_to state_crime_path(assigns(:state_crime))
  end

  test "should destroy state_crime" do
    assert_difference('StateCrime.count', -1) do
      delete :destroy, id: @state_crime
    end

    assert_redirected_to state_crimes_path
  end
end

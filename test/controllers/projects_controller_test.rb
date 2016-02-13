require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase
  test "should get list" do
    get :list
    assert_response :success
  end

  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get get" do
    get :get
    assert_response :success
  end

  test "should get delete" do
    get :delete
    assert_response :success
  end

end

require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase
  setup do
    # create an user first
    activate_authlogic
    UserSession.create(users(:daqing))
  end
  
  test "should get new" do
    get :new, :user_id => current_user.id
    assert_response :success

    assert assigns(:project)
  end

  test "should create project" do
    assert_difference('Project.count') do
      post :create, :project => {:name => "demo project"}
    end

    assert_redirected_to project_path(assigns(:project))
  end

  test "should get show" do
    get :show, :id => projects(:one).id
    assert_response :success
  end
end
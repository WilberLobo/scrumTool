require 'test_helper'

class ProjectUserStoriesControllerTest < ActionController::TestCase
  setup do
    @project_user_story = project_user_stories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:project_user_stories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create project_user_story" do
    assert_difference('ProjectUserStory.count') do
      post :create, project_user_story: { projectId: @project_user_story.projectId, userStoryDesc: @project_user_story.userStoryDesc, userStoryName: @project_user_story.userStoryName }
    end

    assert_redirected_to project_user_story_path(assigns(:project_user_story))
  end

  test "should show project_user_story" do
    get :show, id: @project_user_story
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @project_user_story
    assert_response :success
  end

  test "should update project_user_story" do
    patch :update, id: @project_user_story, project_user_story: { projectId: @project_user_story.projectId, userStoryDesc: @project_user_story.userStoryDesc, userStoryName: @project_user_story.userStoryName }
    assert_redirected_to project_user_story_path(assigns(:project_user_story))
  end

  test "should destroy project_user_story" do
    assert_difference('ProjectUserStory.count', -1) do
      delete :destroy, id: @project_user_story
    end

    assert_redirected_to project_user_stories_path
  end
end

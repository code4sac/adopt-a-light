require 'test_helper'

class ProblemsControllerTest < ActionController::TestCase
  setup do
    @problem = problems(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:problems)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create problem" do
    assert_difference('Problem.count') do
      post :create, problem: { from_user_id: @problem.from_user_id, problem_desc: @problem.problem_desc, problem_type_id: @problem.problem_type_id, resolved: @problem.resolved, sent: @problem.sent, thing_id: @problem.thing_id, to_user_id: @problem.to_user_id }
    end

    assert_redirected_to problem_path(assigns(:problem))
  end

  test "should show problem" do
    get :show, id: @problem
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @problem
    assert_response :success
  end

  test "should update problem" do
    put :update, id: @problem, problem: { from_user_id: @problem.from_user_id, problem_desc: @problem.problem_desc, problem_type_id: @problem.problem_type_id, resolved: @problem.resolved, sent: @problem.sent, thing_id: @problem.thing_id, to_user_id: @problem.to_user_id }
    assert_redirected_to problem_path(assigns(:problem))
  end

  test "should destroy problem" do
    assert_difference('Problem.count', -1) do
      delete :destroy, id: @problem
    end

    assert_redirected_to problems_path
  end
end

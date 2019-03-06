require 'test_helper'

class MicropostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @micropost = microposts(:one)
  end

  test "should get index" do
    get microposts_url, as: :json
    assert_response :success
  end

  test "should create micropost" do
    assert_difference('Micropost.count') do
      post microposts_url, params: { micropost: { content: @micropost.content, pid: @micropost.pid } }, as: :json
    end

    assert_response 201
  end

  test "should show micropost" do
    get micropost_url(@micropost), as: :json
    assert_response :success
  end

  test "should update micropost" do
    patch micropost_url(@micropost), params: { micropost: { content: @micropost.content, pid: @micropost.pid } }, as: :json
    assert_response 200
  end

  test "should destroy micropost" do
    assert_difference('Micropost.count', -1) do
      delete micropost_url(@micropost), as: :json
    end

    assert_response 204
  end
end

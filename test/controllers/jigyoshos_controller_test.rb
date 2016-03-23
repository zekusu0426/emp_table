require 'test_helper'

class JigyoshosControllerTest < ActionController::TestCase
  setup do
    @jigyosho = jigyoshos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:jigyoshos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create jigyosho" do
    assert_difference('Jigyosho.count') do
      post :create, jigyosho: { cd: @jigyosho.cd, flg: @jigyosho.flg, from_ymd: @jigyosho.from_ymd, mail: @jigyosho.mail, name: @jigyosho.name, ryakusho: @jigyosho.ryakusho, sort_num: @jigyosho.sort_num, to_ymd: @jigyosho.to_ymd }
    end

    assert_redirected_to jigyosho_path(assigns(:jigyosho))
  end

  test "should show jigyosho" do
    get :show, id: @jigyosho
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @jigyosho
    assert_response :success
  end

  test "should update jigyosho" do
    patch :update, id: @jigyosho, jigyosho: { cd: @jigyosho.cd, flg: @jigyosho.flg, from_ymd: @jigyosho.from_ymd, mail: @jigyosho.mail, name: @jigyosho.name, ryakusho: @jigyosho.ryakusho, sort_num: @jigyosho.sort_num, to_ymd: @jigyosho.to_ymd }
    assert_redirected_to jigyosho_path(assigns(:jigyosho))
  end

  test "should destroy jigyosho" do
    assert_difference('Jigyosho.count', -1) do
      delete :destroy, id: @jigyosho
    end

    assert_redirected_to jigyoshos_path
  end
end

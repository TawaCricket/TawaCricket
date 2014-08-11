require 'test_helper'

class ImageTablesControllerTest < ActionController::TestCase
  setup do
    @image_table = image_tables(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:image_tables)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create image_table" do
    assert_difference('ImageTable.count') do
      post :create, image_table: { photo: @image_table.photo }
    end

    assert_redirected_to image_table_path(assigns(:image_table))
  end

  test "should show image_table" do
    get :show, id: @image_table
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @image_table
    assert_response :success
  end

  test "should update image_table" do
    patch :update, id: @image_table, image_table: { photo: @image_table.photo }
    assert_redirected_to image_table_path(assigns(:image_table))
  end

  test "should destroy image_table" do
    assert_difference('ImageTable.count', -1) do
      delete :destroy, id: @image_table
    end

    assert_redirected_to image_tables_path
  end
end

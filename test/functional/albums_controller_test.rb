require 'test_helper'

class AlbumsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Album.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Album.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Album.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to album_url(assigns(:album))
  end

  def test_edit
    get :edit, :id => Album.first
    assert_template 'edit'
  end

  def test_update_invalid
    Album.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Album.first
    assert_template 'edit'
  end

  def test_update_valid
    Album.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Album.first
    assert_redirected_to album_url(assigns(:album))
  end

  def test_destroy
    album = Album.first
    delete :destroy, :id => album
    assert_redirected_to albums_url
    assert !Album.exists?(album.id)
  end
end

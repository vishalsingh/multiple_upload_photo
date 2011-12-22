class AlbumsController < ApplicationController
  
  def show
    @album = Album.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    @album = @user.albums.new
     3.times do
        photo = @album.photos.build
       	  4.times { photo.tags.build }
    end
  end

  def create
     @user = User.find(params[:user_id])
    @album = @user.albums.create(params[:album])
    redirect_to album_path(@album), :notice => "#{@user.name} your album added successfully"
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy
    redirect_to root_path, :notice => "Album destroy successfully"
  end
end

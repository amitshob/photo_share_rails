class PhotosController < ApplicationController

  def index
    @photos = Photo.all
    render :index
  end

  def show
    @photo = Photo.find(params[:id])
    render :show
  end

  def new
    @photo = Photo.new
    render :new
  end

  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      redirect_to  photos_path
    else
      render :new
    end
  end
  
  def share_photo
   @photo = Photo.find(params[:id])
   @user = User.find(params[:user_id])
   @photo.users << @user
   redirect_to :back
 end



  private
  def photo_params
    params.require(:photo).permit(:title, :description, :image, :user_id)
  end

end

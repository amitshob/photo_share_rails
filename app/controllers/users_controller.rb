class UsersController < ApplicationController
  def new
    @photo = Photo.find(params[:photo_id])
    @user = @photo.users.new
  end
  def create
    @photo = Photo.find(params[:photo_id])
    @user = @photo.users.new(user_params)
    if @user.valid?
     @photo.users << @user
      redirect_to photo_path(@photo)
    else
      render :new
    end
  end

  def edit
     render:new
  end

  def update
    @photo = Photo.find(params[:photo_id])
    @user = @photo.users.new(user_params)
    if @user.update(user_params)
      redirect_to photo_path(@photo)
    else
      render:new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @photo = Photo.find(params[:photo_id])
    @user = @photo.users.new(user_params)
    @user.destroy
    redirect_to photos_path
  end
private
  def user_params
    # params.require(:user).permit(:username, :user_ids => [], :photo_id)
    params.require(:user).permit(:username, :user_ids, :photo_id)
  end



end

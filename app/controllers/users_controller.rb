class UsersController < ApplicationController
  def new
    @photo = Post.find(params[:post_id])
    @user = @photo.tags.new
  end
  def create
    @photo = Post.find(params[:post_id])
    @user = @photo.tags.new(tag_params)
    if @user.save
      redirect_to post_path(@photo)
    else
      render :new
    end
  end

  def edit
     render:new
  end

  def update
    @photo = Post.find(params[:post_id])
    @user = @photo.tags.new(tag_params)
    if @user.update(tag_params)
      redirect_to post_path(@photo)
    else
      render:new
    end
  end

  def show
  end

  def destroy
    @photo = Post.find(params[:post_id])
    @user = @photo.tags.new(tag_params)
    @user.destroy
    redirect_to posts_path
  end
private
  def tag_params
    params.require(:user).permit(:name)
  end



end

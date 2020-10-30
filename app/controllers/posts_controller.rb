class PostsController < ApplicationController
  before_action :set_search
  before_action :authenticate_user!, only: [:new,:create,:edit,:update,:destroy]

  def set_search
    @search = Post.ransack(params[:q])
    @search_posts = @search.result.page(params[:page]).per(5)
  end

  def index
    @posts = Post.includes(:user).all.page(params[:page]).per(5)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_path, success: '投稿に成功しました！'
    else
      flash[:alert] = '投稿に失敗しました'
      render :new
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
    @comment = Comment.new
    @comments = @post.comments.order(created_at: :desc)
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    if @post.update(post_params)
      redirect_to posts_path, success: '投稿を編集しました！'
    else
      render action: :edit
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    redirect_to posts_path, success: '投稿を削除しました！'
  end

  private

  def post_params
    params.require(:post).permit(:title, :text, :img, :rate, :address, :latitude, :longitude)
  end
end

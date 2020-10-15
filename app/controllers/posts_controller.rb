class PostsController < ApplicationController
  before_action :set_search
  
  def set_search
    @search = Post.ransack(params[:q])
    @search_posts = @search.result(created_at: :desc).page(params[:page]).per(5)
  end
  
  def index
    @posts = Post.all.order(created_at: :desc).page(params[:page]).per(5)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_index_path, success: '投稿に成功しました！'
    else
      flash[:alert] = '投稿に失敗しました'
      render :new
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    if @post.update(post_params)
      redirect_to('/posts/index')
    else
      render action: :edit
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])

    @post.destroy

    redirect_to('/posts/index')
  end

  private

    def post_params
      params.require(:post).permit(:title, :text, :img, :rate, :address, :latitude, :longitude)
    end
end

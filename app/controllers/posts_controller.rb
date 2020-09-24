class PostsController < ApplicationController
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
        flash[:alert] = "投稿に失敗しました"
        render :new
        end
    end

    def show

    @post = Post.find_by(id: params[:id])
        
    end

    
    
    private


    def post_params
        params.require(:post).permit( :title, :text, :img )
    end
end

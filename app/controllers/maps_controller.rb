class MapsController < ApplicationController
  before_action :set_search

  def set_search
    @search = Post.ransack(params[:q])
    @search_posts = @search.result(created_at: :desc).page(params[:page]).per(5)
  end

  def index
    @posts = Post.all
  end
end

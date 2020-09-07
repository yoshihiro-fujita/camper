class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @posts = Post.all.order(id: "DESC")
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post =  Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
    redirect_to post_path(@post), notice: "投稿しました。"
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    if @post.user != current_user
      redirect_to posts_path, alert: "不正なアクセスです。"
      end
    end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
    redirect_to post_path(@post),notice: "投稿を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to user_path(post.user), notice: "投稿を削除しました"
  end
private
    def post_params
      params.require(:post).permit(:title, :body, :image)
    end
end

class PostsController < ApplicationController
  
  def index
    @posts = Post.all
    render json: {status: :ok, posts: @posts}
  end

  def create
    current_user = User.find_by(id: post_params[:user_id])
    @post = current_user.posts.build(post_params)
    if @post.save
      render json: {status: :created, post: @post}
    else
      render json: {status: :notok, errors: {message: "post data is incorrect"}}
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
    if @post
      render json: {status: :ok, post: @post}
    else
      render json: {status: :notok, errors: {message: "Id not found"}}
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
    if @post.update(post_params)
      render json: {status: :ok, post: @post}
    end
  end

  private

    def post_params
      params.require(:post).permit(:title, :body, :user_id)
    end
end

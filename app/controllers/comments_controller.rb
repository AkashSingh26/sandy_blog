require 'pry'
class CommentsController < ApplicationController
  def index
    @post = Post.find_by(id: params[:post_id])
    @comments = @post.comments
    render json: {status: :ok, comments: @comments}
  end

  def show
    @post = Post.find_by(id: params[:post_id])
    @comment = @post.comments.find_by(id: params[:id])
    render json: {status: :ok, comment: @comment}
  end

  def create
    # binding.pry
    @user = User.find_by(id: 1)
    @post = Post.find_by(id: params[:post_id])
    @comment = @post.comments.build({body: params[:body]})
    @comment.user_id = @user.id
    if @comment.save
      render json: {status: :created, comment: @comment}
    else
      render json: {status: :notok}
    end
  end

  def update

  end

  private
    def comment_params
      params.require(:comment).require(:body)
    end
end

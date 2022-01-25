class LikesController < ApplicationController
  def index
  end

  def show
  end

  def create
  end

  def edit
  end


  private
    def comment_params
      params.require(:comment).require(:body, :user_id)
    end
end

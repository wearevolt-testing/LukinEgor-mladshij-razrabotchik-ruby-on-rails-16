class Api::V1::CommentsController < ApplicationController
  before_action :authenticate_user, only: %i[index create]

  def index
    comments = Post.find(params[:post_id]).comments
    render json: comments
  end

  def create
    comment = Comment.create(comment_params)
    comment.published_at = published_at
    if comment.save
      render json: comment
    else
      render json: { errors: comment.errors }
    end
  end

  private

  def comment_params
    params.permit(:body)
  end

  def published_at
    params[:published_at] || DateTime.now
  end
end

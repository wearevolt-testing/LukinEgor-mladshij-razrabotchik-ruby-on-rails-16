class Api::V1::PostsController < ApplicationController
  before_action :authenticate_user, only: %i[index create show]

  include Pagination

  def index
    # TODO think about optimization
    posts = Post.all
    render json: posts[pagination_range]
  end

  def show
    post = Post.find(params[:id])
    render json: post
  end

  def create
    post = Post.new(post_params)
    post.published_at = published_at
    post.author = current_user
    if post.save
      render json: post
    else
      render json: { errors: post.errors }
    end
  end

  private

  def pagination_range
    page = params[:page].to_i
    per_page = params[:per_page].to_i
    pages(page, per_page)
  end

  def post_params
    params.permit(:title, :body)
  end

  def published_at
    params[:published_at] || DateTime.now
  end
end

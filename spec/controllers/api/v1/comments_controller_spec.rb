require 'rails_helper'

RSpec.describe 'Api::V1::CommentsController', type: :request do
  def authenticated_header(user)
    token = Knock::AuthToken.new(payload: { sub: user.id }).token
    { authorization: "Bearer #{token}" }
  end

  it 'create comment' do
    user = create(:user)
    simple_post = create(:post)
    comment_params = { body: 'test' }
    url = "/api/v1/posts/#{simple_post.id}/comments"
    post url, params: comment_params, headers: authenticated_header(user)
    expect(response.status).to be_eql(200)
  end

  it 'show all comments for post' do
    user = create(:user)
    comments_count = 15
    simple_post = create(:post_with_comments, comments_count: comments_count)
    url = "/api/v1/posts/#{simple_post.id}/comments"
    get url, headers: authenticated_header(user)
    expect(response.status).to be_eql(200)
    json = JSON.parse(response.body)
    expect(json.length).to be_eql(comments_count)
  end
end

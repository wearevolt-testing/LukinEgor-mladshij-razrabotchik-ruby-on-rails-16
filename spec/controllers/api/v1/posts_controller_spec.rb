require 'rails_helper'

RSpec.describe 'Api::V1::PostsController', type: :request do
  def authenticated_header(user)
    token = Knock::AuthToken.new(payload: { sub: user.id }).token
    { authorization: "Bearer #{token}" }
  end

  it 'create post with published_at field' do
    user = create(:user)
    post_params = { title: 'title', body: 'body', published_at: DateTime.now }
    post '/api/v1/posts', params: post_params, headers: authenticated_header(user)
    expect(response.status).to be_eql(200)
    json = JSON.parse(response.body)
    expect(json['id']).to_not be_nil
    expect(json['title']).to be_eql('title')
    expect(json['body']).to be_eql('body')
    expect(json['published_at']).to_not be_nil
    expect(json['author_nickname']).to be_eql(user.nickname)
  end

  it 'create post without field published_at field' do
    user = create(:user)
    post_params = { title: 'title', body: 'body' }
    post '/api/v1/posts', params: post_params, headers: authenticated_header(user)
    expect(response.status).to be_eql(200)
    json = JSON.parse(response.body)
    expect(json['id']).to_not be_nil
    expect(json['title']).to be_eql('title')
    expect(json['body']).to be_eql('body')
    expect(json['published_at']).to_not be_nil
    expect(json['author_nickname']).to be_eql(user.nickname)
  end

  it 'show post by id' do
    user = create(:user)
    posts = create_list(:post, 5)
    get "/api/v1/posts/#{posts.first.id}", headers: authenticated_header(user)
    expect(response.status).to be_eql(200)
    json = JSON.parse(response.body)
    expect(json['id']).to_not be_nil
    expect(json['title']).to be_eql(posts.first.title)
    expect(json['body']).to be_eql(posts.first.body)
    expect(json['published_at']).to_not be_nil
    expect(json['author_nickname']).to be_eql(posts.first.author.nickname)
  end

  it 'show all posts by page and per_page' do
    user = create(:user)
    posts = create_list(:post, 15)
    request_params = { page: 2, per_page: 5 }
    get '/api/v1/posts', params: request_params, headers: authenticated_header(user)
    expect(response.status).to be_eql(200)
    json = JSON.parse(response.body)
    expect(json.length).to be_eql(5)
    expect(json[0]['id']).to be_eql(posts[6].id)
    expect(json[4]['id']).to be_eql(posts[10].id)
  end
end

require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'is valid with params' do
    user = create(:user)
    post = Post.new(title: 'title',
                    body: 'body',
                    author: user,
                    published_at: DateTime.now)
    expect(post).to be_valid
  end

  it 'is not valid without params' do
    expect(Post.new).to_not be_valid
  end
end

require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'is valid with body' do
    post = create(:post)
    comment = Comment.new(body: 'hello', post: post, published_at: DateTime.now)
    expect(comment).to be_valid
  end

  it 'is not valid without body' do
    expect(Comment.new).to_not be_valid
  end
end

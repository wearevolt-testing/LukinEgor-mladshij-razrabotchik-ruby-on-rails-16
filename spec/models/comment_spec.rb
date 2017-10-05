require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'is valid with body' do
    expect(Comment.new(body: 'hello', published_at: DateTime.now)).to be_valid
  end

  it 'is not valid without body' do
    expect(Comment.new).to_not be_valid
  end
end

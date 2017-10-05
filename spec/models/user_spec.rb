require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with params' do
    user = User.new(nickname: 'user', email: 'test@mail.com', password: 'test')
    expect(user).to be_valid
  end

  it 'is not valid without params' do
    expect(User.new).to_not be_valid
  end

  it 'is not valid with bad email' do
    user = User.new(nickname: 'user', email: 'test', password: 'test')
    expect(user).to_not be_valid
  end

  it 'is not valid with same email' do
    User.create(nickname: 'user', email: 'test@mail.com', password: 'test')
    user2 = User.new(nickname: 'user', email: 'test@mail.com', password: 'test')
    expect(user2).to_not be_valid
  end
end

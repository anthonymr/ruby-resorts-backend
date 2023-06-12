require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.new(name: 'Example User', username: 'username', email: 'test@test.com', password: 'password')
  end

  it 'is valid with valid attributes' do
    expect(@user).to be_valid
  end

  it 'is not valid without a name' do
    @user.name = nil
    expect(@user).to_not be_valid
  end

  it 'is not valid without a username' do
    @user.username = nil
    expect(@user).to_not be_valid
  end

  it 'is not valid without an email' do
    @user.email = nil
    expect(@user).to_not be_valid
  end

  it 'is not valid without a password' do
    @user.password = nil
    expect(@user).to_not be_valid
  end

  it 'is not valid with a duplicate username' do
    @user.save
    user2 = User.new(name: 'Example User', username: 'username', email: 'test2@test.com', password: 'password')
    expect(user2).to_not be_valid
  end

  it 'is not valid with a duplicate email' do
    @user.save
    user2 = User.new(name: 'Example User', username: 'username2', email: 'test@test.com', password: 'password')
    expect(user2).to_not be_valid
  end
end

require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { Post.new(title: 'My Post', comment_counter: 10, likes_counter: 10) }

  before { subject.save }

  it 'Title should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'Title length should be maximum 250' do
    subject.title = 'a' * 300
    expect(subject).to_not be_valid
  end

  it 'Comment counter should be integer' do
    subject.comment_counter = 'z'
    expect(subject).to_not be_valid
  end

  it 'Comment counter should be 0 or greater' do
    subject.comment_counter = -1
    expect(subject).to_not be_valid
  end

  it 'Likes counter should be integer' do
    subject.likes_counter = 'z'
    expect(subject).to_not be_valid
  end

  it 'Likes counter should be 0 or greater' do
    subject.likes_counter = -1
    expect(subject).to_not be_valid
  end

  describe '#recent_comments' do
    let(:post) do
      Post.create(title: 'Test Post', author:, text: 'This is test post', comment_counter: 0, likes_counter: 0)
    end
    let(:author) { User.create(name: 'Kunda', photo: 'https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=580&q=80', bio: 'Carpenter') }

    let!(:comment1) { Comment.create(author:, post:, text: 'Comment one') }
    let!(:comment2) { Comment.create(author:, post:, text: 'Comment two') }
    let!(:comment3) { Comment.create(author:, post:, text: 'Comment three') }
    let!(:comment4) { Comment.create(author:, post:, text: 'Comment four') }
    let!(:comment5) { Comment.create(author:, post:, text: 'Comment five') }
    let!(:comment6) { Comment.create(author:, post:, text: 'Comment six') }

    it 'returns the most recent 5 comments' do
      expect(post.recent_comments.size).to eq(5)
    end
  end

  describe '#update_posts_counter' do
    let(:user) { User.create(name: 'Jolly Alber', photo: 'https://example.com/photo.jpg', post_counter: 0, bio: 'Legal Head') }
    let(:post) do
      Post.new(title: 'Test Post', author: user, text: 'I come in peace?',
               comment_counter: 0, likes_counter: 0)
    end

    it 'increments the author\'s post_counter' do
      post.save
      expect(user.post_counter).to eq(1)
    end
  end
end

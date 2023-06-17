require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Koshao', photo: 'https://avatars.githubusercontent.com/u/92449654?v=4', post_counter: 10, bio: 'Software Developer') }

  before { subject.save }

  it 'Name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'Post counter must be an integer' do
    subject.post_counter = 'z'
    expect(subject).to_not be_valid
  end

  it 'Post counter should be 0 or greater' do
    subject.post_counter = -1
    expect(subject).to_not be_valid
  end
end

RSpec.describe User, type: :model do
  describe '#recent_posts' do
    let(:new_user) { User.create(name: 'Kunda', photo: 'https://images.unsplash.com/photo-1633332755192-727a05c4013d', bio: 'Tella') }

    before do
      Post.create(title: 'Test Post', author: new_user, text: 'This is a test post', comment_counter: 0,
                  likes_counter: 0)
      Post.create(author: new_user, title: 'Codding',
                  text: 'Software development is a crucial aspect of the tech industry', comment_counter: 0,
                  likes_counter: 0)
      Post.create(author: new_user, title: 'Lugha', text: 'Unasema Lugha?', comment_counter: 0, likes_counter: 0)
      Post.create(author: new_user, title: 'Peace Maker', text: 'I come in peace?', comment_counter: 0,
                  likes_counter: 0)
    end

    it 'returns the last 3 posts' do
      recent_posts = new_user.recent_posts
      expect(recent_posts.size).to eq 3
    end
  end
end

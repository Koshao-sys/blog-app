require 'rails_helper'

describe Like, type: :model do
  before :each do
    @author = User.new(name: 'Koshao', photo: 'https://avatars.githubusercontent.com/u/92449654?v=4',
                       bio: 'Software Developer')
    @post = Post.new(author: @author, title: 'Programming', text: 'Is such a beauty')
    @like = Like.create(author: @author, post: @post)
  end

  it 'Update likes counter' do
    expect(@post.likes_counter).to eq 1
  end
end

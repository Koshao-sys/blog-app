require 'rails_helper'

describe Comment, type: :model do
  before :each do
    @author = User.new(name: 'Koshao', photo: 'https://avatars.githubusercontent.com/u/92449654?v=4',
                       bio: 'Software Developer')
    @post = Post.new(author: @author, title: 'Programming', text: 'Is such a beauty')

    @comment1 = Comment.create(author: @author, post: @post, text: 'First Comment')
    @comment2 = Comment.create(author: @author, post: @post, text: 'Second Comment')
  end

  it 'will have the Posts comments_counter through update_comments_counter ' do
    expect(@post.comment_counter).to eq 2
  end
end

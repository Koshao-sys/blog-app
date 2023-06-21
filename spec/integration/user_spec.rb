require 'rails_helper'

RSpec.describe 'User Index Page', type: :feature do
  before do
    User.create(
      name: 'John',
      photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      bio: 'Teacher in school',
      post_counter: 0
    )

    User.create(
      name: 'Alice',
      photo: 'https://unsplash.com/photos/123',
      bio: 'Software engineer',
      post_counter: 2
    )

    User.create(
      name: 'Bob',
      photo: 'https://unsplash.com/photos/456',
      bio: 'Designer',
      post_counter: 5
    )
  end

  it 'displays usernames of all users' do
    visit '/users'
    expect(page).to have_content('John')
    expect(page).to have_content('Alice')
    expect(page).to have_content('Bob')
  end

  it 'displays profile pictures for each user' do
    visit '/users'
    expect(page).to have_css("img[src='https://unsplash.com/photos/F_-0BxGuVvo']")
    expect(page).to have_css("img[src='https://unsplash.com/photos/123']")
    expect(page).to have_css("img[src='https://unsplash.com/photos/456']")
  end

  it 'displays the number of posts for each user' do
    visit '/users'
    expect(page).to have_css('.card-text', text: 'Number of posts: 0', count: 1)
    expect(page).to have_css('.card-text', text: 'Number of posts: 2', count: 1)
    expect(page).to have_css('.card-text', text: 'Number of posts: 5', count: 1)
  end

  it 'redirects to user show page when clicking on a user' do
    visit '/users'
    user = User.first
    click_link(user.name)
    expect(current_path).to eq("/users/#{user.id}")
  end
end

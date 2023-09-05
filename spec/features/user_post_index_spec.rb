require 'rails_helper'

RSpec.feature 'User Post index page', type: :feature do
  let!(:user) do
    create(:user, name: 'Tom', bio: 'Teacher from Mexico', posts_counter: 3, photo: 'https://placehold.co/120x120')
  end
  let!(:posts) { create_list(:post, 3, author: user) }

  scenario "I can see the user's profile picture" do
    visit user_posts_path(user)
    expect(page).to have_css("img[src*='https://placehold.co/120x120']")
  end
  scenario "I can see the user's username" do
    visit user_posts_path(user)
    expect(page).to have_content('Tom')
  end
  scenario 'I can see the number of posts the user has written' do
    visit user_posts_path(user)
    expect(page).to have_content('Number of posts: 3')
  end
  scenario "I can see a post's title" do
    visit user_posts_path(user)
    posts.each do |post|
      expect(page).to have_content(post.title)
    end
  end
  scenario "I can see some of the post's body" do
    visit user_posts_path(user)
    posts.each do |post|
      expect(page).to have_content(post.text.truncate(50))
    end
  end
  scenario 'I can see the first comments on a post' do
    post = create(:post, author: user)
    create_list(:comment, 1, post: post)
    visit user_posts_path(user)
    first_comment = post.comments.first
    expect(page).to have_content(first_comment.text)
  end
  scenario 'I can see how many comments a post has' do
    posts.each do |post|
      create_list(:comment, 3, post: post)
    end

    visit user_posts_path(user)
    posts.each do |post|
      expect(page).to have_content("Comments: #{post.comments.count}")
    end
  end
  scenario 'I can see how many likes a post has' do
    post = create(:post, author: user)
    create_list(:like, 2, post: post, author: user)
    visit user_posts_path(user)
    expect(page).to have_content("Likes: #{post.likes.count}")
  end
  scenario 'I can see a section for pagination if there are more posts than fit on the view' do
    create_list(:post, 10, author: user)

    visit user_posts_path(user)
    expect(page).to have_css('.pagination')
  end

  scenario "When I click a user's post, it redirects me to that post's show page" do
    user_post = create(:post, author: user, title: 'Sample Post Title', text: 'Sample post text')

    visit user_posts_path(user)
    click_link(user_post.title)
    expect(page).to have_current_path(user_post_path(user, user_post))
  end
end

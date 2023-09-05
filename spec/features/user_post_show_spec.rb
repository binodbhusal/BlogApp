require 'rails_helper'

RSpec.feature 'PostShow', type: :feature do
  let!(:user) { create(:user, name: 'Tom') }
  let!(:post) { create(:post, author: user, title: 'Sample Post Title', text: 'Sample post text') }

  scenario "I can see the post's title" do
    visit user_post_path(user, post)
    expect(page).to have_content('Sample Post Title')
  end

  scenario 'I can see who wrote the post' do
    visit user_post_path(user, post)
    expect(page).to have_content("Post by: #{user.name}")
  end

  scenario 'I can see how many comments it has' do
    create_list(:comment, 3, post: post)
    visit user_post_path(user, post)
    expect(page).to have_content('Comments: 3')
  end

  scenario 'I can see how many likes it has' do
    user_liking = create(:user)
    post = create(:post, author: user)
    create_list(:like, 5, post: post, author: user_liking)
    visit user_post_path(user, post)
    expect(page).to have_content('Likes: 5')
  end

  scenario 'I can see the post body' do
    visit user_post_path(user, post)
    expect(page).to have_content('Sample post text')
  end

  scenario 'I can see the username of each commentor' do
    commentors = create_list(:user, 3)
    commentors.each { |commentor| create(:comment, post: post, author: commentor) }
    visit user_post_path(user, post)
    commentors.each do |commentor|
      expect(page).to have_content(commentor.name)
    end
  end

  scenario 'I can see the comment each commentor left' do
    commentors = create_list(:user, 3)
    commentors.each do |commentor|
      create(:comment, post: post, author: commentor, text: "Comment by #{commentor.name}")
    end
    visit user_post_path(user, post)
    commentors.each do |commentor|
      expect(page).to have_content("Comment by #{commentor.name}")
    end
  end
end

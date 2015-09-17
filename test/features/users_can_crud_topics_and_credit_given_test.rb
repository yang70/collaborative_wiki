require 'test_helper'

feature "user can create, read, edit, delete a topic, user email shows in credits" do
  scenario "any user can read topics" do
    visit root_path
    page.text.must_include "Title One"
    visit topic_path(topics(:topic1))
    page.text.must_include "Fixture topic body one"
    sign_in(:user1)
    visit topic_path(topics(:topic1))
    page.text.must_include "Fixture topic body one"
  end

  scenario "logged in user can create new topic, verify credit" do
    sign_in(:user1)
    visit root_path
    click_on 'Create new topic'
    fill_in "Title", with: "I created a topic, elephant"
    click_on 'Create Topic'
    page.text.must_include "elephant"
    page.html.must_include "<td>test1@example.com"
  end

  scenario "logged in user can edit existing topic, verify credit" do
    sign_in(:user1)
    visit topic_path(topics(:topic1))
    page.text.must_include "Title One"
    click_on "Edit"
    fill_in "Title", with: "New title"
    click_on "Update Topic"
    page.text.must_include "New title"
    page.html.must_include "<td>test1@example.com"
  end

  scenario "logged in user can delete existing topic" do
    sign_in(:user1)
    visit topic_path(topics(:topic1))
    click_on "Delete"
    page.text.must_include "Title One was deleted!"
    page.html.wont_include "<td>Title One"
  end
end

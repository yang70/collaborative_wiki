require "test_helper"

feature "Non Logged In Users Dont See Links" do
  scenario "non logged in users see/don't see certain links" do
    visit root_path
    page.text.must_include "Sign in"
    visit topic_path(topics(:topic1))
    page.text.wont_include "Edit"
    page.text.wont_include "Delete"
  end

  scenario "Non logged in users can't hack the url to edit" do
    visit edit_topic_path(topics(:topic1))
    page.text.must_include "You need to sign in or sign up before continuing."
  end
end

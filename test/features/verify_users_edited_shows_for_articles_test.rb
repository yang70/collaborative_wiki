require 'test_helper'

feature "user page shows articles user has edited" do
  scenario "visit user page, see edited article" do
    sign_in(:user1)
    visit author_path(users(:user1))
    page.html.wont_include "Title One"
    visit edit_topic_path(topics(:topic1))
    click_on "Update Topic"
    visit author_path(users(:user1))
    page.html.must_include "Title One"
  end
end

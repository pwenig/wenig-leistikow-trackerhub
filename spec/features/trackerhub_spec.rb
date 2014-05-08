require 'spec_helper'

feature "View projects" do
  scenario "User view a list of projects" do
    VCR.use_cassette('features/projects') do
      visit ("/")
      click_on "View Projects"
      expect(page).to have_content "URL Shortner"
      expect(page).to have_content "wenig and leistikow's Tracker hub"
    end

  end

  scenario "User can see all of the stories in a project" do
    VCR.use_cassette('features/projects/url_shortener') do
      visit ("/")
      click_on "View Projects"
      click_on "URL Shortner"
      expect(page).to have_content "user tries to shorten a non-url"
    end
  end

  scenario "User can see all of the comments for stories in a project" do
    VCR.use_cassette('features/projects/comments/url_shortener') do
      visit ("/")
      click_on "View Projects"
      click_on "URL Shortner"
      expect(page).to have_content "A great start. Please see if you can bump the button to be more centered under the text box. Don't spend more than 15 minutes on it."
    end
  end

  scenario "User can see all Github comments for stores in a project" do
    VCR.use_cassette('features/projects/github_comments/url_shortener', :record => :all) do
      visit ("/")
      click_on "View Projects"
      click_on "URL Shortner"
      expect(page).to have_content "Great job."
    end
  end
  #https://api.github.com/repos/bluevajra/tibetan_dictionary/commits/1a1f4dd6d65fd09118313b0934d7e81a2f6b3c1b/comments
  #Authorization Basic Ymx1ZXZhanJhOjEwOEdpdEh1YjEqOA==
end
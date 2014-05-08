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
end
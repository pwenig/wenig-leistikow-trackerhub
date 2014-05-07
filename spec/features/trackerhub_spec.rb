require 'spec_helper'

feature "View projects" do
  scenario "User view a list of projects" do
    visit ("/")
    click_on "View Projects"
    expect(page).to have_content "URL Shortner"
    expect(page).to have_content "wenig and leistikow's Tracker hub"

  end
end
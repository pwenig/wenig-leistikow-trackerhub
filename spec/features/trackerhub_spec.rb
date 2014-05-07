require 'spec_helper'

feature "View projects" do
  scenario "User view a list of projects" do
    visit ("/")
    click_on "View Projects"
    expect(page).to have_content "exercism-exercises"
    expect(page).to have_content "warmups"

  end
end
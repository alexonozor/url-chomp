require 'rails_helper'

RSpec.feature "ShortenLinks", type: :feature do

  Capybara.default_driver = :selenium

  scenario "Visit root path" do
    visit root_path
    expect(page).to have_content('Paste your long URL here:')
    expect(page).to have_selector('form')
    fill_in('shorter_long_url', :with => 'https://facebook.com')
    click_on('Chomp URL')
  end
end

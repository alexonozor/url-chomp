require 'rails_helper'
require 'database_cleaner'
DatabaseCleaner.strategy = :truncation

# then, whenever you need to clean the DB
DatabaseCleaner.clean

RSpec.feature "Signups", type: :feature do
  Capybara.default_driver = :selenium
  scenario "User should be able to SignUp" do
    visit root_path
    click_link "Login"
    expect(page).to have_content('All because of URL.. well...')
    expect(page).to have_selector('form')
    click_on 'Register'
    fill_in('email', :with => "mic@test.com")
    fill_in('user[password]', :with => "testingooo")
    fill_in('user[password_confirmation]', :with => "testingooo")
    click_on('Register Now')
    expect(page).to have_content('Welcome! You have signed up successfully')
    user = User.last
    expect(user.email).to eq("mic@test.com")
    expect(user.password).not_to eq("testingooo")
  end
end

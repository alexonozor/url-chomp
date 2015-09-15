require 'rails_helper'

RSpec.feature "Logins", type: :feature do
  Capybara.default_driver = :selenium
  scenario "User Should be Able to Login" do
      visit root_path
      click_link "Login"
      expect(page).to have_content('All because of URL.. well...')
      expect(page).to have_selector('form')
      fill_in 'user[email]', :with => 'test@test.com'
      fill_in 'user[password]', :with => 'testing'
      click_on 'login-submit'
      expect(page).to have_content('Signed in successfully.')
    end
end

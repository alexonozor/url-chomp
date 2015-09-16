require 'rails_helper'
require 'database_cleaner'
require 'pry'

RSpec.feature "Logins", type: :feature do
  Capybara.default_driver = :selenium
  scenario "User Should be Able to Login" do
      visit root_path
      click_link "Login"
      expect(page).to have_content('All because of URL.. well...')
      expect(page).to have_selector('form')
      user =  User.create!(:email => "alexonozor@gmail.com", :password => "onozorgheneho")
      fill_in 'user[email]', :with => "alexonozor@gmail.com"
      fill_in 'user[password]', :with => "onozorgheneho"
      click_on 'login-submit'
      binding.pry
      expect(page).to have_content('Signed in successfully.')
      DatabaseCleaner.strategy = :truncation
      DatabaseCleaner.clean
    end
end

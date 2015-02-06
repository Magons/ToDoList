require 'rails_helper'

feature 'User sign in with Facebook', %q{
  In order to be able to do list
  As an User
  I want to be able to sign in with  Facebook
} do

  scenario 'Non-registered user tries to sign in with Facebook', js: true do
    visit new_user_session_path
    expect(page).to have_content 'Sign in with Facebook'
    mock_auth_hash_facebook
    screenshot_and_open_image
    click_link "Sign in with Facebook"
    expect(page).to have_content 'Successfully authenticated from Facebook account.'
    expect(page).to have_link 'Logout'
  end

  scenario "Non-authenticated if error with facebook oauth" , js: true do
    OmniAuth.config.mock_auth[:facebook] = :invalid_credentials
    visit new_user_session_path
    expect(page).to have_content 'Sign in with Facebook'
    click_link "Sign in with Facebook"
    expect(page).to have_link 'Sign in'
    expect(page).to have_content "Could not authenticate you from Facebook"
  end
 end
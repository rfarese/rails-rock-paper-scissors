require 'rails_helper'

RSpec.feature "User creates a new account;", type: :feature do

  def fill_in_name_and_email
    click_link "Sign Up"
    fill_in "user_name", with: "Jon"
    fill_in "user_email", with: "jonsmith123@yahoo.com"
  end

  def fill_in_valid_passwords
    fill_in "user_password", with: "password"
    fill_in "Password confirmation", with: "password"
  end

  scenario "User sees link to create a new account" do
    visit root_path

    expect(page).to have_content("Sign Up")
  end

  scenario "user provides valid and required information" do
    visit root_path
    fill_in_name_and_email
    fill_in_valid_passwords
    click_button "Submit"

    expect(page).to have_content("Welcome! You have signed up successfully.")
    expect(page).to have_content("Sign Out")
    expect(page).to_not have_content("Sign In")
    expect(page).to_not have_content("Sign Up")
    expect(User.all.size).to eq(1)
  end

  scenario "User doesn't provide any email address" do
    visit root_path
    click_link "Sign Up"
    fill_in "user_name", with: "jon"
    fill_in "user_email", with: ''
    fill_in_valid_passwords
    click_button "Submit"

    expect(page).to have_content("can't be blank")
    expect(User.all.size).to eq(0)
  end

  scenario "User doesn't provide a valid email address" do
    visit root_path
    click_link "Sign Up"
    fill_in "user_name", with: "jon"
    fill_in "user_email", with: 'user'
    fill_in_valid_passwords
    click_button "Submit"

    expect(page).to have_content("invalid")
    expect(User.all.size).to eq(0)
  end

  scenario "User password doesn't match with their password confirmation" do
    visit root_path
    fill_in_name_and_email
    fill_in "user_password", with: "password"
    fill_in "Password confirmation", with: "differentPassword"
    click_button "Submit"

    expect(page).to have_content("Please review the problems below:")
    expect(page).to have_content("doesn't match Password")
    expect(User.all.size).to eq(0)
  end
end

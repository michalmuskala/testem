require "spec_helper"

feature "User authentication" do

  scenario "User registers" do
    visit '/users/sign_up'

    fill_in 'Email', with: 'test@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign up'

    expect(page).to have_text('You have signed up successfully.')
  end

  scenario "User signs in" do
    user = create :user

    visit '/users/sign_in'

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    expect(page).to have_text('Signed in successfully.')
  end
end
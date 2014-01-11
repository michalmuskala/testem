require "spec_helper"

feature "Admin authentication" do

  scenario "Guest tries to enter admin page" do
    visit "/admin"

    expect(current_path).to eq('/users/sign_in')
    expect(page).to have_text('You need to sign in or sign up before continuing.')
  end

  scenario "User tries to enter admin page" do
    user = create :user
    login_as(user, scope: :user)
    visit "/admin"

    expect(current_path).to eq('/')
    expect(page).to have_text('You are not authorized.')
  end

  scenario "Admin tries to enter admin page" do
    admin = create :admin
    login_as(admin, scope: :user)
    visit "/admin"

    expect(page).to have_text('Welcome')
  end
end
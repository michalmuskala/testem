require "spec_helper"

feature "Admin managing users" do
  given(:admin) { create :admin }

  background do
    login_as(admin, scope: :user)
  end

  scenario "Admin lists all users" do
    users = create_list :user, 5
    users_count = User.count
    user = users.first

    visit "/admin/users"

    # Test listing users
    expect(page).to have_text("All users")
    expect(page).to have_css('tr.user', count: users_count)

    # Test list elements
    within first('tr.user') do
      expect(page).to have_link(user.email, href: "/admin/users/#{user.id}")
    end
  end

  context "with an existing user" do
    given(:user) { create :user }

    scenario "Admin views user" do
      visit "/admin/users/#{user.id}"

      expect(page).to have_text(user.email)
      expect(page).to have_text(user.admin ? 'True' : 'False')
      expect(page).to have_text(user.created_at)
      expect(page).to have_text(user.updated_at)
      expect(page).to have_text(user.remember_created_at)
      expect(page).to have_text(user.current_sign_in_at)
      expect(page).to have_text(user.last_sign_in_at)
      expect(page).to have_text(user.sign_in_count)
      expect(page).to have_text(user.current_sign_in_ip)
      expect(page).to have_text(user.last_sign_in_ip)
    end

    scenario "Admin sets user as admin" do
      visit "/admin/users/#{user.id}/edit"

      check 'Admin'
      click_button 'Save'

      expect(page).to have_text('Admin: True')
    end

    scenario "Admin unsets admin" do
      admin2 = create :admin
      visit "/admin/users/#{admin2.id}/edit"

      uncheck 'Admin'
      click_button 'Save'

      expect(page).to have_text('Admin: False')
    end

    scenario "Admin cannot unset himself as admin" do
      visit "/admin/users/#{admin.id}/edit"

      uncheck 'Admin'
      click_button 'Save'

      expect(page).to have_text('Admin: True')
      expect(page).to have_text('You cannot edit yourself, try editing your profile')
    end
  end
end
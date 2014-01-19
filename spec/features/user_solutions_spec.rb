require "spec_helper"

feature "User solving quizzes" do
  let(:quiz) { create :quiz_with_questions_and_answers }
  let(:user) { create :user }

  background do
    login_as(user, scope: :user)
  end

  scenario "User solves quiz" do
    visit "/quizzes/#{quiz.id}"
    click_link 'Solve quiz'

    expect(page).to have_text(quiz.name)

    click_button 'Save'

    expect(page).to have_text('Mark')
  end

  context "after solving a quiz" do
    background do
      visit "/quizzes/#{quiz.id}"
      click_link 'Solve quiz'

      expect(page).to have_text(quiz.name)

      click_button 'Save'
    end

    scenario 'User lists solutions' do
      visit '/solutions'

      expect(page).to have_link(quiz.name)
    end

    scenario 'User request email delivery' do
      visit "/solutions"
      click_link quiz.name

      click_link 'Deliver results email'
      email = ActionMailer::Base.deliveries.last
      expect(email.to).to include(user.email)
      expect(email.subject).to eq quiz.name
    end
  end
end
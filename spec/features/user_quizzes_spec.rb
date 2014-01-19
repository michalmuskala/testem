require "spec_helper"

feature "User accessing quizzes" do

  scenario "User lists available quizzes" do
    quizzes = create_list :quiz, 5
    quiz = quizzes.first

    visit "/"

    # Test listing quizzes
    expect(page).to have_text("All currently available quizzes")
    expect(page).to have_css('.quiz', count: 5)

    # Test list elements
    within first('.quiz') do
      expect(page).to have_link(quiz.name, href: "/quizzes/#{quiz.id}")
    end
  end

  context "with an existing full quiz and user" do
    given(:quiz) { create :quiz_with_questions_and_answers }
    given(:user) { create :user }

    scenario "User must be logged in to see quiz" do
      visit "/quizzes/#{quiz.id}"

      expect(current_path).to eq('/users/sign_in')
      expect(page).to have_text('You need to sign in or sign up before continuing.')

      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'

      expect(page).to have_text('Signed in successfully.')
      # Test whether user is redirected to the quiz page correcttly
      expect(page).to have_text(quiz.name)
    end

    context "with authenticated user" do
      background do
        login_as(user, scope: :user)
      end

      scenario "User views a quiz" do
        question = quiz.questions.first
        answer = question.answers.first
        visit "/quizzes/#{quiz.id}"

        # Test quiz
        expect(page).to have_text(quiz.name)
        expect(page).to have_css('div.question', count: quiz.questions.count)

        # Test questions
        within first('div.question') do
          expect(page).to have_text(question.text)
          expect(page).to have_css('.answer', count: question.answers.count)

          # Test answers
          within first('.answer') do
            expect(page).to have_text(answer.text)
          end
        end
      end
    end
  end
end
require "spec_helper"

feature "Admin managing quizzes" do
  given(:admin) { create :admin }

  background do
    login_as(admin, scope: :user)
  end

  scenario "Admin lists available quizzes" do
    quizzes = create_list :quiz, 5
    quiz = quizzes.first

    visit "/admin/quizzes"

    # Test listing quizzes
    expect(page).to have_text("All currently available quizzes")
    expect(page).to have_css('tr.quiz', count: 5)

    # Test list elements
    within first('tr.quiz') do
      expect(page).to have_link(quiz.name, href: "/quizzes/#{quiz.id}")
    end
  end

  # Slooow due to js
  scenario "Admin adds new quiz" do #, js: true do
    quiz = build :quiz
    visit '/admin/quizzes/new'

    fill_in 'Name', with: quiz.name
    click_button 'Create'

    expect(page).to have_text('Quiz created successfully')
    expect(page).to have_text(quiz.name)
  end

  # context "with an existing full quiz and user" do
  #   given(:quiz) { create :quiz_with_questions_and_answers }
  #   given(:user) { create :user }

  #   scenario "User must be logged in to see quiz" do
  #     visit "/quizzes/#{quiz.id}"

  #     expect(current_path).to eq('/users/sign_in')

  #     fill_in 'Email', with: user.email
  #     fill_in 'Password', with: user.password
  #     click_button 'Log in'

  #     expect(page).to have_text('Signed in successfully.')
  #     # Test whether user is redirected to the quiz page correcttly
  #     expect(page).to have_text(quiz.name)
  #   end

  #   context "with authenticated user" do
  #     background do
  #       login_as(user, scope: :user)
  #     end

  #     scenario "User views a quiz" do
  #       question = quiz.questions.first
  #       answer = question.answers.first
  #       visit "/quizzes/#{quiz.id}"

  #       # Test quiz
  #       expect(page).to have_text(quiz.name)
  #       expect(page).to have_text(quiz.description)
  #       expect(page).to have_css('div.question', count: quiz.questions.count)
  #       expect(page).to have_selector('form')

  #       # Test questions
  #       within first('div.question') do
  #         expect(page).to have_text(question.text)
  #         expect(page).to have_text(question.description)
  #         expect(page).to have_css('div.answer', count: question.answers.count)

  #         # Test answers
  #         within first('div.answer') do
  #           expect(page).to have_selector('label', text: "#{answer.text} #{answer.hint}")
  #           within 'label' do
  #             expect(page).to have_css('input[type="checkbox"]')
  #           end
  #         end
  #       end
  #     end
  #   end
  # end
end
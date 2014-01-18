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
      expect(page).to have_link(quiz.name, href: "/admin/quizzes/#{quiz.id}")
    end
  end

  # Slooow due to js
  scenario "Admin adds new quiz" do
    quiz = build :quiz
    question = build :question
    answer = build :answer
    visit '/admin/quizzes/new'

    fill_in 'Name', with: quiz.name
    fill_in 'Question', with: question.text
    fill_in 'Answer', with: answer.text
    click_button 'Create'

    expect(page).to have_text(quiz.name)
    expect(page).to have_text(question.text)
    expect(page).to have_text(answer.text)
    expect(page).to have_text('Quiz created successfully')
  end

  context "with an existing quiz" do
    given(:quiz) { create :quiz_with_questions_and_answers }

    scenario "Admin views quiz" do
      visit "admin/quizzes/#{quiz.id}"

      expect(page).to have_text(quiz.name)
      quiz.questions.each do |question|
        expect(page).to have_text(question.text)
        question.answers.each do |answer|
          expect(page).to have_text(answer.text)
        end
      end
      expect(page).to have_link('Edit quiz')
      expect(page).to have_link('Remove quiz')
    end

    scenario "Admin edits quiz" do
      visit "admin/quizzes/#{quiz.id}"

      click_link 'Edit quiz'

      within all(:css, '.question').last do
        fill_in 'Question', with: 'Edited question'
      end
      click_button 'Save'

      expect(page).to have_text('Edited question')
    end

    scenario "Admin deletes quiz" do
      visit "admin/quizzes/#{quiz.id}"

      click_link 'Remove quiz'

      expect(page).not_to have_text(quiz.name)
      expect(page).to have_text('Quiz removed')
    end
  end
end
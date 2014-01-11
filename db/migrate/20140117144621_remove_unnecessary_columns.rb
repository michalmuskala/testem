class RemoveUnnecessaryColumns < ActiveRecord::Migration
  def change
    remove_column :answers, :hint
    remove_column :questions, :description
    remove_column :quizzes, :description
  end
end

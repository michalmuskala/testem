class AddIndexes < ActiveRecord::Migration
  def change
    add_index :questions, :quiz_id
    add_index :answers, :question_id
  end
end

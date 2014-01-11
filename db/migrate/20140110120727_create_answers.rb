class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :text
      t.boolean :correct
      t.text :hint
      t.references :question

      t.timestamps
    end
  end
end

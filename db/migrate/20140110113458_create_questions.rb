class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :text
      t.text :description
      t.references :quiz

      t.timestamps
    end
  end
end

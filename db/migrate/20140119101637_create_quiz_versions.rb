class CreateQuizVersions < ActiveRecord::Migration
  def change
    create_table :quiz_versions do |t|
      t.references :quiz, index: true
      t.text :content

      t.timestamps
    end
  end
end

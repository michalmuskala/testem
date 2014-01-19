class CreateSolutions < ActiveRecord::Migration
  def change
    create_table :solutions do |t|
      t.references :quiz_version, index: true
      t.text :answers
      t.references :user, index: true

      t.timestamps
    end
  end
end

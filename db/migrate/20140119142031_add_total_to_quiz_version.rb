class AddTotalToQuizVersion < ActiveRecord::Migration
  def change
    add_column :quiz_versions, :total, :integer
  end
end

class AddMarkToSolution < ActiveRecord::Migration
  def change
    add_column :solutions, :mark, :integer
  end
end

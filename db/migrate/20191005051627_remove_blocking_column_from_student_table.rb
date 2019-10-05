class RemoveBlockingColumnFromStudentTable < ActiveRecord::Migration[6.0]
  def change
    remove_column :students, :max_books_blocking
  end
end

class CreateStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :students do |t|
      t.string :email
      t.string :name
      t.string :password
      t.integer :educational_level
      t.references :university, null: false, foreign_key: true
      t.integer :max_books_blocking

      t.timestamps
    end
  end
end

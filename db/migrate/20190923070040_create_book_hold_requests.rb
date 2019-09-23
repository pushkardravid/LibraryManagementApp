class CreateBookHoldRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :book_hold_requests do |t|
      t.references :student, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true
      t.references :library, null: false, foreign_key: true
      t.integer :reason

      t.timestamps
    end
  end
end

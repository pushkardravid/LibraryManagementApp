class CreateBookLibraryMappings < ActiveRecord::Migration[6.0]
  def change
    create_table :book_library_mappings do |t|
      t.references :book, null: false, foreign_key: true
      t.references :library, null: false, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end

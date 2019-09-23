class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :isbn
      t.string :title
      t.string :language
      t.string :published
      t.string :edition
      t.text :image
      t.text :subject
      t.text :summary
      t.boolean :special

      t.timestamps
    end
  end
end

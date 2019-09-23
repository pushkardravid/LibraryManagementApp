class CreateLibrarians < ActiveRecord::Migration[6.0]
  def change
    create_table :librarians do |t|
      t.string :email
      t.string :name
      t.string :password
      t.references :library, null: false, foreign_key: true

      t.timestamps
    end
  end
end

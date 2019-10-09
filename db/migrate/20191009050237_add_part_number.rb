class AddPartNumber < ActiveRecord::Migration[6.0]
  def change
    change_column :books, :image, :string
  end
end

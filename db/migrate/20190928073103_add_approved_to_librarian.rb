class AddApprovedToLibrarian < ActiveRecord::Migration[6.0]
  def change
    add_column :librarians, :approved, :boolean
  end
end

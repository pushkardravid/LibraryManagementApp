class AddFkLibraryUniversity < ActiveRecord::Migration[6.0]
  def change
    add_reference :libraries, :university, index: true, foreign_key: true
  end
end

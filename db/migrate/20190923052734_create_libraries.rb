class CreateLibraries < ActiveRecord::Migration[6.0]
  def change
    create_table :libraries do |t|
      t.string :name
      t.text :location
      t.integer :max_days_blocking
      t.integer :overdue_fines

      t.timestamps
    end
  end
end

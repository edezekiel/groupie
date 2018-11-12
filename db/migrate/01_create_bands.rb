class CreateBands < ActiveRecord::Migration[5.0]
  def change
    create_table :bands do |table|
      table.string :name
      table.string :genre
      table.integer :num_of_members
    end
  end
end

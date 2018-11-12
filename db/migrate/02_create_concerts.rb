class CreateConcerts < ActiveRecord::Migration[5.0]
  def change
    create_table :concerts do |table|
      table.string :title
      table.string :location
      table.integer :price
    end
  end
end

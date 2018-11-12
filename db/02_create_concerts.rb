class CreateConcerts < ActiveRecord::Migration[5.0]
  def change
    create_table :concerts do |table|
      t.string :title
      t.string :location
      t.integer :price
    end
  end
end

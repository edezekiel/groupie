class CreateBand < ActiveRecord::Migration[5.0]
  def change
    create_table :bands do |table|
      table.string :name
      table.genre :string
      table.num_of_members :integer
  end

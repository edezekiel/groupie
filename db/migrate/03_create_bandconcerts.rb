class CreateBandConcerts < ActiveRecord::Migration[5.0]
  def change
    create_table :bandconcerts do |table|

      table.integer :band_id
      table.integer :concert_id
     end
  end
end

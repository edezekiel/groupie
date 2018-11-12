class CreateBandConcerts < ActiveRecord::Migration[5.0]
  def change
    create_table :bandconcerts do |table|
      #TODO: fill in the band and concert ids
      table.integer
      table.integer
    end
  end
end

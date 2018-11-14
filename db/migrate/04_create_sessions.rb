class CreateSessions < ActiveRecord::Migration[5.0]
  def change
    create_table :sessions do |t|
      t.integer :band_id
      t.integer :concert_id
      # t.belongs_to :band, index: true
      # t.belongs_to :concert, index: true
    end
  end
end

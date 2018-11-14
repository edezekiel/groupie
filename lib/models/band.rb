class Band < ActiveRecord::Base
  has_many :bandsconcerts
  has_many :concerts, through: :bandsconcerts
end

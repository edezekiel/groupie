class Band < ActiveRecord::Base
  has_many :concerts, through: :bandsconcerts
end

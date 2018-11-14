class Concert < ActiveRecord::Base
  has_many :sessions
  has_many :bands, through: :sessions
end

class Team < ActiveRecord::Base
  belongs_to :matches
  has_many :users
  has_and_belongs_to_many :tournaments
end

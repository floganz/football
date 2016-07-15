class Team < ActiveRecord::Base
  belongs_to :matches
  has_many :users
end

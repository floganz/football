class Team < ActiveRecord::Base
  belongs_to :matches
  has_many :users
  has_and_belongs_to_many :tournaments

  scope :search, ->(keyword) { joins("INNER JOIN users ON
    users.id = teams.first_user_id OR users.id = teams.second_user_id
    WHERE teams.name = '#{keyword}' OR users.name = '#{keyword}' OR
    users.surname = '#{keyword}'").uniq if keyword.present? }
end

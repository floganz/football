class Match < ActiveRecord::Base
  belongs_to :first_team_id
  belongs_to :second_team_id
end

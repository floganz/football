class Team < ActiveRecord::Base
  belongs_to :matches
  has_many :users
  has_and_belongs_to_many :tournaments

  scope :search, ->(keyword) { select("teams.id, teams.first_user_id,
    teams.second_user_id, teams.name AS team_name, teams.active, users.name, 
    users.surname")
    .joins("INNER JOIN users ON
    users.id = teams.first_user_id OR users.id = teams.second_user_id
    WHERE teams.name = '#{keyword}' OR users.name = '#{keyword}' OR
    users.surname = '#{keyword}'") if keyword.present? }

  scope :find_team, ->(id) { select("teams.name AS team_name, teams.active, 
    users.name, users.surname, users.photo, users.id AS user_id")
    .joins("INNER JOIN users ON
    users.id = teams.first_user_id OR users.id = teams.second_user_id
    WHERE teams.id = #{id}") if id.present? }

  scope :team_info, ->(id) { select("tournaments.id AS tour_id, 
    tournaments.name, tournaments.status")
    .joins(:tournaments).distinct if id.present?}

  scope :user_teams, ->(id) { select("teams.name AS team_name,
    teams.active, teams.id AS team_id")
  .joins("INNER JOIN users ON teams.first_user_id = users.id OR
    teams.second_user_id = users.id")
    .where("users.id = #{id}")
    .order("teams.active DESC") if id.present? }

  #scope :order_by_active, -> { order("teams.active DESC") }
end

# , tournaments.name
# .joins(:tournaments)
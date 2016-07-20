class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :teams
  has_and_belongs_to_many :tournaments

  #validates :name, :surname, :email, :password, presence: true
  #validates :password, confirmation: true

  scope :user_tournaments, ->(id) { select("tournaments.name AS tour_name,
    tournaments.status, tournaments.id AS tour_id").distinct.joins(:tournaments)
  .where("users.id = #{id}") if id.present?}

  scope :teams, ->(id) { select("teams.name AS team_name,
    teams.active, teams.id AS team_id").distinct
  .joins("INNER JOIN teams ON teams.first_user_id = users.id OR
    teams.second_user_id = users.id")
  .where("users.id = #{id}")
  .order("teams.active DESC") if id.present?}

  scope :search, ->(keyword) { select("users.id, users.name, users.surname, 
  users.photo, teams.name AS team_name, teams.id AS team_id,
  teams.active")
    .joins("LEFT OUTER JOIN teams ON (teams.first_user_id = users.id OR
    teams.second_user_id = users.id) AND teams.active = true")
    .where("upper(users.name) = upper('#{keyword}') OR 
      upper(users.surname) = upper('#{keyword}')") if keyword.present? }
end

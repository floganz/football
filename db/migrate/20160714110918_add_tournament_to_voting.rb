class AddTournamentToVoting < ActiveRecord::Migration
  def change
    add_column :votings, :tournament_id, :integer
    add_foreign_key :votings, :tournaments, name: :tournament_id, column: :id 
  end
end

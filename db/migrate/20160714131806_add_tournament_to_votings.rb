class AddTournamentToVotings < ActiveRecord::Migration
  def change
    add_reference :votings, :tournament, index: true, foreign_key: true
  end
end

class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :first_team_id
      t.integer :second_team_id
      t.integer :first_team_goals
      t.integer :second_team_goals

      t.timestamps null: false
    end
  	add_foreign_key :matches, :teams, column: :first_team_id, primary_key: :id
  	add_foreign_key :matches, :teams, column: :second_team_id, primary_key: :id
  end
end

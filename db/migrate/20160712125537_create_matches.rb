class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|

      t.integer :first_team_goals
      t.integer :second_team_goals

      t.timestamps null: false
    end
    add_foreign_key :matches, :teams, name: :first_team_id
    add_foreign_key :matches, :teams, name: :second_team_id
  end
end

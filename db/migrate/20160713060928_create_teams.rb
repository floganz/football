class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.integer :first_user_id
      t.integer :second_user_id
      t.string :name
    end
  	add_foreign_key :teams, :users, column: :first_user_id, primary_key: :id
  	add_foreign_key :teams, :users, column: :second_user_id, primary_key: :id
  end
end

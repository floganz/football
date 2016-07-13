class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.integer :first_user_id
      t.integer :second_user_id
      t.string :name
    end
  	add_foreign_key :teams, :users, name: :first_user_id, column: :id
  	add_foreign_key :teams, :users, name: :second_user_id, column: :id
  end
end

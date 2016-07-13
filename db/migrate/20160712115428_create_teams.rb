class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.integer :first_user_id
      t.integer :second_user_id
      t.string :name
    end
  end
end

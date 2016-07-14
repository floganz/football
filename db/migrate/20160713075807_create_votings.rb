class CreateVoting < ActiveRecord::Migration
  def change
    create_table :votings do |t|
      t.integer :vote_user_id
      t.integer :user_id
      t.integer :rank
    end
    add_foreign_key :votings, :users, name: :vote_user_id, primary_key: :id
    add_foreign_key :votings, :users, name: :user_id, primary_key: :id
  end
end

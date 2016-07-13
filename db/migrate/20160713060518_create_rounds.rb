class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.references :tournament, index: true, foreign_key: true
      t.string :name
      t.string :round_type
      t.integer :order
    end
  end
end

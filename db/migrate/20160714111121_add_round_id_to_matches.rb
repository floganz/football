class AddRoundIdToMatches < ActiveRecord::Migration
  def change
    add_column :matches, :round_id, :string
    add_foreign_key :matches, :rounds, name: :round_id, column: :id
  end
end

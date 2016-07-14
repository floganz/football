class AddRoundToMatches < ActiveRecord::Migration
  def change
    add_reference :matches, :round, index: true, foreign_key: true
  end
end

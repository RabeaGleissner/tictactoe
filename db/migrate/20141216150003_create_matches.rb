class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :player_x_id
      t.integer :player_o_id
      t.integer :winner_id
      t.integer :loser_id
      t.boolean :completed

      t.timestamps
    end
  end
end

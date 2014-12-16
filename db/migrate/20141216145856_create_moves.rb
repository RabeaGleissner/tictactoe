class CreateMoves < ActiveRecord::Migration
  def change
    create_table :moves do |t|
      t.references :user, index: true
      t.integer :position
      t.references :match, index: true
      t.string :value

      t.timestamps
    end
  end
end

class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.references :user
      t.references :deck
      t.integer :card_index, default: 0
      t.timestamps null: false
    end
  end
end

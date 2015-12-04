class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.references :user
      t.references :deck
      t.boolean :finished
      t.timestamps null: false
    end
  end
end

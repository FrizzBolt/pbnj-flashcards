class CreateGuesses < ActiveRecord::Migration
  def change
    create_table :guesses do |t|
      t.references :round
      t.boolean :correctness

      t.timestamps
    end
  end
end

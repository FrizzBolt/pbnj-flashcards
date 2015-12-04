class CreateDecks < ActiveRecord::Migration
  def change
    create_table :decks do |t|
      t.string :title, { limit: 64, null: false }
      t.references :user

      t.timestamps
    end
  end
end

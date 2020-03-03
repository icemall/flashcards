class CreateDecks < ActiveRecord::Migration[5.2]
  def change
    create_table :decks do |t|
      t.references :user, null: false
      t.string :name, null: false
      t.boolean :current, default: false

      t.timestamps
    end
  end
end

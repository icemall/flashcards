class SetCardsNotNullable < ActiveRecord::Migration[5.2]
  def up
    change_column :cards, :original_text, :string, null: false
    change_column :cards, :translated_text, :string, null: false
    change_column :cards, :review_date, :date, null: false
  end
  def down
    change_column :cards, :original_text, :string
    change_column :cards, :translated_text, :string
    change_column :cards, :review_date, :date
  end
end

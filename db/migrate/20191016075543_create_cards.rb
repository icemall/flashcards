# frozen_string_literal: true

class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.string :original_text, null: false
      t.string :translated_text, null: false
      t.date :review_date, null: false
    end
  end
end

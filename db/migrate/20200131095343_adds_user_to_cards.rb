# frozen_string_literal: true

class AddsUserToCards < ActiveRecord::Migration[5.2]
  def change
    add_reference :cards, :user, null: false
  end
end

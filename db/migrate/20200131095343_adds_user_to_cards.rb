class AddsUserToCards < ActiveRecord::Migration[5.2]
  def change
    add_reference :cards, :user
  end
end

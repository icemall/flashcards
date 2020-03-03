class RemoveUserIdFromCards < ActiveRecord::Migration[5.2]
  def up
    remove_reference :cards, :user
  end

  def down
    add_reference :cards, :user
  end
end

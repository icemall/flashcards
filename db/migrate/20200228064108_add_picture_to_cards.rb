class AddPictureToCards < ActiveRecord::Migration[5.2]
  def change
    add_column :cards, :picture, :string
  end
end


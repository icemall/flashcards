class AddLeitnerAttributesToCards < ActiveRecord::Migration[5.2]
  def change
    add_column :cards, :leitner_level, :integer, default: 0
    add_column :cards, :attempts, :integer, default: 0
  end
end

class AddLeitnerAttributesToCards < ActiveRecord::Migration[5.2]
  def change
    change_table(:cards) do |t|
      t.integer :attempts, :leitner_level, default: 0
    end
  end
end

class ChangesReviewDateToReviewTime < ActiveRecord::Migration[5.2]
  def up
    ActiveRecord::Base.transaction do
      rename_column :cards, :review_date, :review_time
      change_column :cards, :review_time, :datetime
    end
  end

  def down
    ActiveRecord::Base.transaction do
      rename_column :cards, :review_time, :review_date
      change_column :cards, :review_date, :date
    end
  end
end

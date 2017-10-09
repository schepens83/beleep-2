class CreateDayScores < ActiveRecord::Migration[5.1]
  def change
    create_table :day_scores do |t|
      t.date :day
      t.decimal :tension
      t.decimal :sleep

      t.timestamps
    end
  end
end

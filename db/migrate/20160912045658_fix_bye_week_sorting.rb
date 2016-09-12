class FixByeWeekSorting < ActiveRecord::Migration[5.0]
  def change
    change_column :nfl_byes, :bye_week, :integer
  end
end

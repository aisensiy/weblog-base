class ChangeTimeTypeInPageViews < ActiveRecord::Migration
  def up
    change_column :page_views, :start_time, :datetime
    change_column :page_views, :end_time, :datetime
  end

  def down
    change_column :page_views, :start_time, :float
    change_column :page_views, :end_time, :float
  end
end

class CreatePageViews < ActiveRecord::Migration
  def change
    create_table :page_views do |t|
      t.string :title, limit: 1023
      t.string :url, limit: 1023
      t.float :start_time
      t.integer :duration
      t.float :end_time
      t.string :status
      t.integer :user_id

      t.timestamps
    end
  end
end

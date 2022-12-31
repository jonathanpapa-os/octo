class CreateTimeTrackers < ActiveRecord::Migration[6.1]
  def change
    create_table :time_trackers do |t|
      t.string :name
      t.string :email
      t.date :time_start
      t.date :time_end
      t.float :total_time

      t.timestamps
    end
  end
end

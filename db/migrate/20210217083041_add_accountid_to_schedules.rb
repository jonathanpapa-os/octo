class AddAccountidToSchedules < ActiveRecord::Migration[6.1]
  def change
    add_column :schedules, :account_id, :string, :after => :id
  end
end

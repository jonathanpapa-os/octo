class AddNameToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string, :after => :email, null: false
  end
end

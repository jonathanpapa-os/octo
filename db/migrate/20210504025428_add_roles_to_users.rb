class AddRolesToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :superadmin_role, :boolean, default: false, :after => :name
    add_column :users, :supervisor_role, :boolean, default: false, :after => :superadmin_role
    add_column :users, :user_role, :boolean, default: true, :after => :supervisor_role
  end
end

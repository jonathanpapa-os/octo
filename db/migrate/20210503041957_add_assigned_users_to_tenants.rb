class AddAssignedUsersToTenants < ActiveRecord::Migration[6.1]
  def change
    add_column :tenants, :email, :string, :after => :id
  end
end

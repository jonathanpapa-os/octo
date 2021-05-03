class AddTenantInfoToAppointments < ActiveRecord::Migration[6.1]
  def change
    add_column :appointments, :tenant_id, :string, :after => :email
    add_column :appointments, :company_name, :string, :after => :id
  end
end

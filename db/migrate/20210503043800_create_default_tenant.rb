class CreateDefaultTenant < ActiveRecord::Migration[6.1]
  def self.up
    # Initialize first account:
    Tenant.create! do |u|
      u.email     = 'superadmin@octosched.com'
      u.url     = 'admin'
      u.company_name    = 'Superadmin'
      u.company_description = 'Superadmin access'
    end
  end

  def self.down
    # By default, we don't want to make any assumption about how to roll back a migration when your
    # model already existed. Please edit below which fields you would like to remove in this migration.
    raise ActiveRecord::IrreversibleMigration
  end
end

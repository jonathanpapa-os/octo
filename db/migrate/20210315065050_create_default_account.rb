class CreateDefaultAccount < ActiveRecord::Migration[6.1]
  def self.up
    # Initialize first account:
    Account.create! do |u|
      u.slug     = 'admin'
      u.name    = 'Superadmin'
      u.description = 'Superadmin access'
    end
  end

  def self.down
    # By default, we don't want to make any assumption about how to roll back a migration when your
    # model already existed. Please edit below which fields you would like to remove in this migration.
    raise ActiveRecord::IrreversibleMigration
  end
end

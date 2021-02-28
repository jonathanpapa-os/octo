class AddDeviseToUsers < ActiveRecord::Migration[6.1]
  def self.up
    # Initialize first account:
    User.create! do |u|
      u.email     = 'superadmin@octosched.com'
      u.password    = 'oyG6Q3659kBrhJYDPjNuUTfosdUQAjd'
      u.superadmin_role = 1
    end
  end

  def self.down
    # By default, we don't want to make any assumption about how to roll back a migration when your
    # model already existed. Please edit below which fields you would like to remove in this migration.
    raise ActiveRecord::IrreversibleMigration
  end
end
